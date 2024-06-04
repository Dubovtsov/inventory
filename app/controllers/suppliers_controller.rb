class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]
  before_action :set_suppliers, only: %i[ index create update destroy ]

  def index
  end

  def show
  end

  def new
    @supplier = Contractor.new(type: 'Supplier')
  end

  def edit
  end

  def create
    @supplier = Contractor.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        # format.html { redirect_to supplier_url(@supplier), notice: "supplier was successfully created." }
        format.turbo_stream do
          helpers.fields model: Product.new do |form|
            @form = form
          end
        end
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        # format.html { redirect_to supplier_url(@supplier), notice: "supplier was successfully updated." }
        format.turbo_stream
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier.destroy!

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def set_suppliers
      @suppliers = Contractor.where(type: 'Supplier')
    end

    def supplier_params
      params.require(:supplier).permit(:type, :name, :fullname, :email, :manager)
    end
end