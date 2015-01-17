class SampleSerializer < ActiveModel::Serializer
  attributes :id, :time, :created_at, :traffic_load
end
