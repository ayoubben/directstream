class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


  def index
    @locations = Location.order(sort_column + " " + sort_direction).search(params[:search_country], params[:search_city]).paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
    end
  end

  def convert_adress
    ConvertAdressJob.perform_later
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:number, :street, :city, :zip_code, :country)
    end
  def sort_column
    Location.column_names.include?(params[:sort]) ? params[:sort] : "country"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
