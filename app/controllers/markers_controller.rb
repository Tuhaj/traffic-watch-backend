class MarkersController < ApplicationController
  respond_to :json

  def sample
    marker = Marker.find(marker_params[:id])
    date = Time.parse(marker_params[:date])
    margin = 8.minutes
    sample = marker.samples.where(created_at: (date - margin)..(date + margin)).last

    render json: { load: sample.traffic_load }

  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Sample not found' }, status: 404
  end

  private

  def marker_params
    params.permit(:id, :date)
  end

end
