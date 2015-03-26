class CitySerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :center, :zoom
  has_many :markers, embed: :objects
end
