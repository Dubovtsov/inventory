class ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_product, only: %i[ show edit update destroy move_to_storehouse clone add_to_invoice remove_from_invoice add_files ]
  before_action :set_invoice, only: %i[ add_to_invoice remove_from_invoice ]

  def index
    if params[:shipped].present?
      @q = Product.ransack(params[:q])
      @products = @q.result.shipped
    else
      @q = Product.ransack(params[:q])
      @products = @q.result.balance_sheet
    end
    if params[:client_id].present?
      @q = Product.ransack(params[:q])
      @products = Product.where(client_id: params[:client_id])
    else
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true).order(:client_id)
    end
    @partners = Client.all + Storehouse.all
    @products = @products.order('title ASC')
    @pagy, @products = pagy_arel(@products, items: 13)
    @grouped_products = @products.group_by &:title

  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def add_to_invoice
    begin
      @product.add_to_invoice(@invoice)
      new_storehouse = @invoice.storehouse
      @product.move_to(new_storehouse, 1)
      respond_to do |format|
        format.html { redirect_to invoice_url(@invoice), notice: "Позиция добавлена" }
      end
    rescue
      flash[:alert] = "Нельзя добавить одну и ту же позицию два раза"
      redirect_to @invoice
    end
  end

  def remove_from_invoice
    @product.remove_from_invoice(@invoice)
    old_storehouse = @product.product_movements.last.from_storehouse
    @product.move_to(old_storehouse, 1)
    respond_to do |format|
      format.html { redirect_to invoice_url(@invoice), notice: "Позиция удалена" }
    end
  end

  def move_to_storehouse
    new_storehouse = Storehouse.find(params[:new_storehouse_id])
    @product.move_to(new_storehouse, 1)
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Позиция перемещена" }
    end
  end

  def clone
    @clone = @product.dup
    @clone.update(serial_number: "-", inventory_number: @clone.set_inventory_number)
    if @clone.save
      flash[:notice] = "Product cloned successfully"
      redirect_to edit_product_path(@clone)
    else
      flash[:alert] = "Product cloning failed"
      redirect_to products_url
    end
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Позиция создана успешно" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Позиция обновлена" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Позиция удалена" }
      format.json { head :no_content }
    end
  end

  def add_files
    if product_params[:images]
      product_params[:images].each do |image|
        @product.images.attach(image)
      end
      redirect_to @product, notice: "Файлы успешно добавлены"
    else
      redirect_to @product, alert: "Не выбрано ни одного файла"
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def set_invoice
      @invoice = Invoice.find(params[:invoice_id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :serial_number, :inventory_number,
                                      :accepted_at, :storehouse_id, :type_product, :picture, :vendor_id, :end_date,
                                      :rent, :shipped, :amount, :client_id, :retail_price, :booking, :purchase_price, images: [])
    end
end
