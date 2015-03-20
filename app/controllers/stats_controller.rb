class StatsController < ApplicationController
  respond_to :json

  def show
    render json: City.find_by_name(city_params[:name]).stats.where('created_at > ?', 6.days.ago.midnight), each_serializer: StatSerializer
  end

  private

  def city_params
    params.permit(:name)
  end

end
