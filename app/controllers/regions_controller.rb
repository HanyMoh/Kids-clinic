class RegionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region, only: [:edit, :update, :destroy]

  # GET /regions
  def index
    @regions = Region.order('created_at desc')
  end


  # GET /regions/new
  def new
    authorize! :create, @region
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
    authorize! :update, @region
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to regions_url, notice: 'Region was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /regions/1
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to regions_url, notice: 'Region was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /regions/1
  def destroy
    authorize! :destroy, @region
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name)
    end
end
