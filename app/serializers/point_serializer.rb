class PointSerializer < ActiveModel::Serializer
  self.root = true
  attributes :id, :lat, :lng
end
