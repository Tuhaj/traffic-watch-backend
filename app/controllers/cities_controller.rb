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

  def traffic
    raise ArgumentError, "No time argument" unless city_params[:time]

    traffic_load = {}
    city = City.find_by_name(city_params[:name])
    markers = city.markers
    margin = 8.minutes
    time = Time.parse(city_params[:time])
    markers.each do |marker|
      traffic_load[marker.id] = marker.samples
        .where(created_at: (time - margin)..(time + margin)).last.traffic_load
    end

  raise ActiveRecord::RecordNotFound if traffic_load.empty?
    render json: { load: traffic_load }

  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Samples not found' }, status: 404

  rescue ArgumentError
    render json: { message: 'No time given' }, status: 404

  end

  private

  def city_params
    params.permit(:name, :time)
  end
end
