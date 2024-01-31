class ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_product, only: %i[ show edit update destroy move_to_storehouse clone ]

  # GET /products or /products.json
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @pagy, @products = pagy(@q.result(distinct: true), items: 8)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def move_to_storehouse
    new_storehouse = Storehouse.find(params[:new_storehouse_id])
    @product.move_to(new_storehouse, 1)
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully created." }
    end
  end

  def clone
    @clone = @product.dup
    @clone.update(serial_number: "-", inventory_number: "-")
    if @clone.save
      flash[:notice] = "Product cloned successfully"
      redirect_to @clone
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

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :serial_number, :inventory_number, :accepted_at, :storehouse_id, :type_product, :picture, :customer, :vendor_id, :end_date, :rent, :shipped, :amount)
    end
end