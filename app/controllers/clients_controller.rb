class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy invoice_create ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def invoice_create
    @invoice = @client.invoices.create!
    respond_to do |format|
      format.html { redirect_to invoice_url(@invoice), notice: "invoice was successfully created." }
    end
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.turbo_stream do
          helpers.fields model: Product.new do |form|
            @form = form
          end
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.prepend('clients', partial: 'clients/client',
        #                                                            locals: { client: @client })
        #   helpers.fields model: Product.new do |form|
        #           render turbo_stream: turbo_stream.update(
        #             :new_client_form, partial: "products/client_select", locals: {form: form}
        #           )
        #   end
        # end
        end
        format.html { redirect_to client_url(@client), notice: 'client was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('modal',
                                                    partial: 'shared/modal',
                                                    locals: { model: @client, title: 'Error' })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end

    # respond_to do |format|

    #   if @client.save
    #     format.turbo_stream do
    #       helpers.fields model: Product.new do |form|
    #         render turbo_stream: turbo_stream.update(
    #           :new_client_form, partial: "products/client_select", locals: {form: form}
    #         )
    #       end
    #     end
    #     format.html { redirect_to client_url(@client), notice: "Клиент успешно добавлен" }
    #     format.json { render :show, status: :created, location: @client }
    #   else
    #     format.turbo_stream do
    #       helpers.fields model: Product.new do |form|
    #         render turbo_stream: turbo_stream.update(
    #           :new_client_form, partial: "products/client_select", locals: {form: form}
    #         )
    #       end
    #     end
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @client.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Обновлено успешно" }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy!

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Клиент удален" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:title)
    end
end
