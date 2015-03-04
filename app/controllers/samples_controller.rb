class SamplesController < ApplicationController
  respond_to :json

  def show
    render json: Sample.where('samples.created_at > ?', 1.day.ago).includes(:city).where(cities: {name: 'Warsaw'}), each_serializer: SampleSerializer
  end

  private

  def city_params
    params.permit(:name)
  end

end
