class CitiesController < ApplicationController
  respond_to :json

  def index
    render json: City.all
  end

  def show
    render json: City.find_by_name(city_params[:name])
  end

  def stats
    render json: { stats: City.find(city_params[:id]).stats.where('created_at > ?', 1.day.ago)}
  end

  private

  def city_params
    params.permit(:id, :name, :center)
  end

end
