class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy complete to_print]
  layout false, only: [:to_print]

  def index
    if current_user.admin?
      @invoices = Invoice.all
    else
      @invoices = current_user.invoices
    end
  end

  def show
    @current_user = current_user
    if params[:query]
      @products = Product.search(params[:query])
    else
      @products = Product.balance_sheet - @invoice.products
    end
  end

  def to_print

  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: "Накладная успешно создана" }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: "Накладная обновлена" }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    respond_to do |format|
      if @invoice.update(invoice_params)
        @invoice.products.each do |product|
          product.product_shipped
        end
        format.html { redirect_to @invoice, notice: "Накладная обновлена" }
        # TODO send email
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy!

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Накладная успешно удалена" }
      format.json { head :no_content }
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:storehouse_id, :user_id, :client_id, :date, :completed, :document_number)
    end
end
