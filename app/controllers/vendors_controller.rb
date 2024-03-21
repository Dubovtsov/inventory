class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[ show edit update destroy ]

  def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @vendor = Vendor.new
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.turbo_stream do
          helpers.fields model: Product.new do |form|
            @form = form
          end
        end
        format.html { redirect_to vendor_url(@vendor), notice: 'Поставщик успешно добавлен.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('modal',
                                                    partial: 'shared/modal',
                                                    locals: { model: @vendor, title: 'Error' })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendor_url(@vendor), notice: "Поставщик обновлен" }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy!

    respond_to do |format|
      format.html { redirect_to vendors_url, notice: "Поставщик удален" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:title, :manager)
    end
end
