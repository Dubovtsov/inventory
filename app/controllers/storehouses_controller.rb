class StorehousesController < ApplicationController
  include Pagy::Backend
  before_action :set_storehouse, only: %i[ show edit update destroy invoice_create ]

  def index
    @storehouses = Storehouse.all.order(:employee)
  end

  def show
    @products = @storehouse.products
    # @pagy, @products = pagy(@products.order(created_at: :desc), items: 12)
  end

  def new
    @storehouse = Storehouse.new
  end

  def invoice_create
    @invoice = @storehouse.invoices.create!
    respond_to do |format|
      format.html { redirect_to invoice_url(@invoice), notice: "Накладная создана" }
    end
  end

  def edit
  end

  def create
    @storehouse = Storehouse.new(storehouse_params)

    respond_to do |format|
      if @storehouse.save
        format.html { redirect_to storehouse_url(@storehouse), notice: "Склад успешно создан" }
        format.json { render :show, status: :created, location: @storehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storehouses/1 or /storehouses/1.json
  def update
    respond_to do |format|
      if @storehouse.update(storehouse_params)
        format.html { redirect_to storehouse_url(@storehouse), notice: "Склад обновлен" }
        format.json { render :show, status: :ok, location: @storehouse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @storehouse.destroy!
      redirect_to storehouses_url, notice: "Склад удален"
    rescue
      flash[:alert] = "Сначала переместите все позиции на другой склад"
      redirect_to @storehouse
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storehouse
      @storehouse = Storehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storehouse_params
      params.require(:storehouse).permit(:title, :description, :image, :employee)
    end
end
