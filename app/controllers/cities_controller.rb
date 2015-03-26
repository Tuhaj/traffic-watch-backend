class CitiesController < ApplicationController
  respond_to :json

  def index
    render json: City.all
  end

  def stats
    if city = City.find_by_name(city_params[:name])
      stats = city.stats.where(created_at: (7.days.ago.midnight)..(Time.new.midnight))
      render json: { stats: stats, each_serializer: StatSerializer }
    else
      render json: { message: 'Record not found' }, status: 404
    end
  end

  private

  def city_params
    params.permit(:name)
  end
end
