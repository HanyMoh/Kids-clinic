class DiagnosesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region, only: [:edit, :update, :destroy]

  # GET /diagnoses
  def index
    authorize! :read, Diagnosis
    @diagnoses = Diagnosis.order('created_at desc')
  end

  # GET /diagnoses/new
  def new
    authorize! :create, Diagnosis
    @diagnosis = Diagnosis.new
  end

  # GET /diagnoses/1/edit
  def edit
    authorize! :update, Diagnosis
  end

  # POST /diagnoses
  def create
    @diagnosis = Diagnosis.new(diagnosis_params)

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to diagnoses_url, notice: 'Diagnosis was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /diagnoses/1
  def update
    respond_to do |format|
      if @diagnosis.update(diagnosis_params)
        format.html { redirect_to diagnoses_url, notice: 'Diagnosis was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /diagnoses/1
  def destroy
    authorize! :destroy, Diagnosis
    @diagnosis.destroy
    respond_to do |format|
      format.html { redirect_to diagnoses_url, notice: 'Diagnosis was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis
      @diagnosis = Diagnosis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_params
      params.require(:diagnosis).permit(:name)
    end
end
