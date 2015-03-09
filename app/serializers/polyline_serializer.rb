class PolylineSerializer < ActiveModel::Serializer
  attributes :id

  # has_many :samples, embed: :objects # used when the ralation was not async
  has_many :points, embed: :objects
end
