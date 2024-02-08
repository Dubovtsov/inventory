class InvoiceProductsController < ApplicationController
  before_action :set_invoice_product, only: %i[ show edit update destroy ]

  # GET /invoice_products or /invoice_products.json
  def index
    @invoice_products = InvoiceProduct.all
  end

  # GET /invoice_products/1 or /invoice_products/1.json
  def show
  end

  # GET /invoice_products/new
  def new
    @invoice_product = InvoiceProduct.new
  end

  # GET /invoice_products/1/edit
  def edit
  end

  # POST /invoice_products or /invoice_products.json
  def create
    @invoice_product = InvoiceProduct.new(invoice_product_params)

    respond_to do |format|
      if @invoice_product.save
        format.html { redirect_to invoice_product_url(@invoice_product), notice: "Invoice product was successfully created." }
        format.json { render :show, status: :created, location: @invoice_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_products/1 or /invoice_products/1.json
  def update
    respond_to do |format|
      if @invoice_product.update(invoice_product_params)
        format.html { redirect_to invoice_product_url(@invoice_product), notice: "Invoice product was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_products/1 or /invoice_products/1.json
  def destroy
    @invoice_product.destroy!

    respond_to do |format|
      format.html { redirect_to invoice_products_url, notice: "Invoice product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_product
      @invoice_product = InvoiceProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_product_params
      params.require(:invoice_product).permit(:product_id, :invoice_id, :closed)
    end
end
