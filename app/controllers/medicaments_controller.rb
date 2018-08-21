class MedicamentsController < ApplicationController
  before_action :set_medicament, only: [:edit, :update, :destroy]

  # GET /medicaments
  def index
    @medicaments = Medicament.all
  end

  # GET /medicaments/new
  def new
    @medicament = Medicament.new
  end

  # GET /medicaments/1/edit
  def edit
  end

  # POST /medicaments
  def create
    @medicament = Medicament.new(medicament_params)

    respond_to do |format|
      if @medicament.save
        format.html { redirect_to medicaments_url, notice: 'Medicament was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /medicaments/1
  def update
    respond_to do |format|
      if @medicament.update(medicament_params)
        format.html { redirect_to medicaments_url, notice: 'Medicament was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /medicaments/1
  def destroy
    @medicament.destroy
    respond_to do |format|
      format.html { redirect_to medicaments_url, notice: 'Medicament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicament
      @medicament = Medicament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_params
      params.require(:medicament).permit(:name)
    end
end
