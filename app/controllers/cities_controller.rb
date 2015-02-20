class CitiesController < ApplicationController
  respond_to :json

  def index
    render json: City.all
  end

  def show
    render json: City.find_by_name(city_params[:name])
  end

  private

  def city_params
    params.permit(:id, :name, :center)
  end

end
