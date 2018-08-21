class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    page_size = params[:page_size]
    @q =  Patient.ransack(params[:q])
    @q.sorts = 'created_at DESC' if @q.sorts.empty?
    @patients = @q.result
    @patients = @patients.page(params[:page])
    @patients = @patients.per(page_size) unless page_size&.empty?
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    authorize! :read, @patient
  end

  # GET /patients/new
  def new
    authorize! :create, @patient
    @patient = Patient.new
    @patient.code = Patient.max_code
  end

  # GET /patients/1/edit
  def edit
    authorize! :update, @patient
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patients_url, notice: 'Patient was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patients/1
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patients_url, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    authorize! :destroy, @patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:code, :name, :phone, :birthdate, :region_id, :address, :note, :is_male)
    end
end
