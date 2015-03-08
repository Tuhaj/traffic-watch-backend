class MarkersController < ApplicationController
  respond_to :json

  def samples
    render json: { samples: Marker.find(marker_params[:marker_id]).samples.where('created_at > ?', 1.day.ago) }
  end

  private

  def marker_params
    params.permit(:marker_id)
  end

end
