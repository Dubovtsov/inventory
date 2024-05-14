class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  before_action :set_customers, only: %i[ index create update destroy ]

  def index
  end

  def show
  end

  def new
    @customer = Contractor.new(type: 'Customer')
  end

  def edit
  end

  def create
    @customer = Contractor.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.turbo_stream do
          helpers.fields model: Product.new do |form|
            @form = form
          end
        end
        # format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        # format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.turbo_stream
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy!

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_customers
      @customers = Contractor.where(type: 'Customer')
    end

    def customer_params
      params.require(:customer).permit(:type, :name, :fullname, :email, :manager)
    end
end
