class ConrtactorsController < ApplicationController
  before_action :set_conrtactor, only: %i[ show edit update destroy ]

  # GET /conrtactors or /conrtactors.json
  def index
    @conrtactors = Conrtactor.all
  end

  # GET /conrtactors/1 or /conrtactors/1.json
  def show
  end

  # GET /conrtactors/new
  def new
    @conrtactor = Conrtactor.new
  end

  # GET /conrtactors/1/edit
  def edit
  end

  # POST /conrtactors or /conrtactors.json
  def create
    @conrtactor = Conrtactor.new(conrtactor_params)

    respond_to do |format|
      if @conrtactor.save
        format.html { redirect_to conrtactor_url(@conrtactor), notice: "Conrtactor was successfully created." }
        format.json { render :show, status: :created, location: @conrtactor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conrtactor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conrtactors/1 or /conrtactors/1.json
  def update
    respond_to do |format|
      if @conrtactor.update(conrtactor_params)
        format.html { redirect_to conrtactor_url(@conrtactor), notice: "Conrtactor was successfully updated." }
        format.json { render :show, status: :ok, location: @conrtactor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conrtactor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conrtactors/1 or /conrtactors/1.json
  def destroy
    @conrtactor.destroy!

    respond_to do |format|
      format.html { redirect_to conrtactors_url, notice: "Conrtactor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conrtactor
      @conrtactor = Conrtactor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conrtactor_params
      params.require(:conrtactor).permit(:type, :name, :fullname, :email, :manager)
    end
end
