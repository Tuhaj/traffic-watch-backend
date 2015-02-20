class MarkerSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :time_without_traffic
end
