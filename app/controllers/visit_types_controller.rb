class VisitTypesController < ApplicationController
  before_action :set_visit_type, only: [:show, :edit, :update, :destroy]

  # GET /visit_types
  # GET /visit_types.json
  def index
    @visit_types = VisitType.all
  end

  # GET /visit_types/1
  # GET /visit_types/1.json
  def show
  end

  # GET /visit_types/new
  def new
    @visit_type = VisitType.new
  end

  # GET /visit_types/1/edit
  def edit
  end

  # POST /visit_types
  # POST /visit_types.json
  def create
    @visit_type = VisitType.new(visit_type_params)

    respond_to do |format|
      if @visit_type.save
        format.html { redirect_to @visit_type, notice: 'Visit type was successfully created.' }
        format.json { render :show, status: :created, location: @visit_type }
      else
        format.html { render :new }
        format.json { render json: @visit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visit_types/1
  # PATCH/PUT /visit_types/1.json
  def update
    respond_to do |format|
      if @visit_type.update(visit_type_params)
        format.html { redirect_to @visit_type, notice: 'Visit type was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit_type }
      else
        format.html { render :edit }
        format.json { render json: @visit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_types/1
  # DELETE /visit_types/1.json
  def destroy
    @visit_type.destroy
    respond_to do |format|
      format.html { redirect_to visit_types_url, notice: 'Visit type was successfully destroyed.' }
      format.json { head :no_content }
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
