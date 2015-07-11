class Api::LocationsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_filter :fetch_location, :except => [:index, :create]

 def fetch_location
    @location = Location.find_by_id(params[:id])
  end

  def index
    @locations = Location.all
    respond_to do |format|
      format.json { render json: @locations }
      format.xml { render xml: @locations }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @location }
      format.xml { render xml: @location }
    end
  end

  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.json { render json: @location, status: :created }
        format.xml { render xml: @location, status: :created }
      else
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.xml { render xml: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update_attributes(location_params)
        format.json { render json: @location, status: :ok }
        format.xml { render xml: @location, status: :ok }
      else
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.xml { render xml: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @location.destroy
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @location.errors, status: :unprocessable_entity }
        format.xml { render xml: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def location_params
    params.require(:location).permit(:country, :city, :street, :number, :zip_code)
  end
end