class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  def index
    authorize! :read, Visit
    page_size = params[:page_size]
    @q =  Visit.includes(:patient,:visit_type).ransack(params[:q])
    @q.sorts = 'visits.created_at DESC' if @q.sorts.empty?
    @visits = @q.result.order('visits.created_at DESC')
    @visits = @visits.page(params[:page])
    @visits = @visits.per(page_size) unless page_size&.empty?
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /visits/1
  def show
    authorize! :read, Visit
  end

  # GET /visits/new
  def new
    authorize! :create, Visit
    @visit = Visit.new
    @visit.code = Visit.max_code
    @visit.turn_num = Visit.current_turn Date.current
    @visit.visit_date = Date.current
    @visit.visit_diagnoses.build
  end

  # GET /visits/1/edit
  def edit
    authorize! :update, Visit
  end

  # POST /visits
  def create
    @visit = Visit.new(visit_params)
    @visit.user = current_user

    respond_to do |format|
      if @visit.save
        format.html { redirect_to visits_url, notice: 'Visit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /visits/1
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visits_url, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    authorize! :destroy, Visit
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    name
    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(
        :visit_date, :patient_id, :visit_type_id, :note, :user_id, :code, :turn_num,
        visit_diagnoses_attributes: [:id, :diagnosis_id, :_destroy],
      )
    end
end
