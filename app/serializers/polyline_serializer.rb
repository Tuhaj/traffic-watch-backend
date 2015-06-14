class PolylineSerializer < ActiveModel::Serializer
  attributes :id
  has_many :points, embed: :objects
end
