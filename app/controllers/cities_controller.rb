class CitiesController < ApplicationController
  respond_to :json

  def index
    render json: City.all
  end

  def stats
    city = get_city
    return render json: { message: 'Record not found' },
      status: 404 unless city

    stats = city.last_week_stats
    render json: { stats: stats, each_serializer: StatSerializer }
  end

  def traffic
    return render json: { message: 'Record not found' },
      status: 404 unless city = get_city

    return render json: { message: 'No time argument' },
      status: 400 unless time = city_params[:time]

    time = Time.parse(time)
    markers = city.markers

    traffic_load = markers.map { |m| [ m[:id], m.load(time) ] }.to_h

    if traffic_load.empty?
      render json: { message: 'Data not found' }, status: 404
    else
      render json: { load: traffic_load }
    end
  end

  private

  def get_city
    City.find_by_name(city_params[:name])
  end

  def city_params
    params.permit(:name, :time)
  end
end
