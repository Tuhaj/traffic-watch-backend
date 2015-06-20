class CitiesController < ApplicationController
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: City.all
  end

  def stats
    stats = get_city.last_week_stats
    render json: { stats: stats, each_serializer: StatSerializer }
  end

  def traffic
    markers = get_city.markers

    return render json: { message: 'No time argument' },
      status: 400 unless time = city_params[:time]
    time = Time.parse(time)

    traffic_load = markers.map { |m| [ m[:id], m.load(time) ] }.to_h
    render json: { load: traffic_load }
  end

  private

  def record_not_found
    render json: { message: 'Record not found' }, status: 404
  end

  def get_city
    unless city = City.find_by_name(city_params[:name])
      raise ActiveRecord::RecordNotFound
    end
    city
  end

  def city_params
    params.permit(:name, :time)
  end
end
