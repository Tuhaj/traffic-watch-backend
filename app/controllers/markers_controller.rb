class MarkersController < ApplicationController
  respond_to :json

  # def samples
  #   render json: { Marker.find(marker_params[:marker_id]).samples.where('created_at > ?', 6.days.ago.midnight).select{|sample| sample.created_at.min < 5} }
  # end

  def load
    date = Time.parse(load_params[:date])
    margin = 5.minutes
    render json: { load: Marker.find(load_params[:marker_id])
      .samples.where('created_at >= ? and created_at < ?', date - margin, date + margin) }
  end

  private

  def marker_params
    params.permit(:marker_id)
  end

  def load_params
    params.permit(:marker_id, :date)
  end

end
