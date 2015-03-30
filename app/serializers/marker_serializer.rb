class MarkerSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :lat, :lng, :time_without_traffic

  has_many :polylines, embed: :objects

end
