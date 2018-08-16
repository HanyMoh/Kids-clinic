class VisitTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visit_type, only: [:edit, :update, :destroy]

  # GET /visit_types
  def index
    @visit_types = VisitType.all
  end

  # GET /visit_types/new
  def new
    authorize! :create, @visit_type
    @visit_type = VisitType.new
  end

  # GET /visit_types/1/edit
  def edit
    authorize! :update, @visit_type
  end

  # POST /visit_types
  def create
    @visit_type = VisitType.new(visit_type_params)

    respond_to do |format|
      if @visit_type.save
        format.html { redirect_to visit_types_url, notice: 'Visit type was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /visit_types/1
  def update
    respond_to do |format|
      if @visit_type.update(visit_type_params)
        format.html { redirect_to visit_types_url, notice: 'Visit type was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /visit_types/1
  def destroy
    authorize! :destroy, @visit_type
    @visit_type.destroy
    respond_to do |format|
      format.html { redirect_to visit_types_url, notice: 'Visit type was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit_type
      @visit_type = VisitType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_type_params
      params.require(:visit_type).permit(:name)
    end
end
