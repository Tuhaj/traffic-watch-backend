class MarkerSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :lat, :lng, :time_without_traffic

  has_many :samples, embed: :objects

  def samples
    object.samples.where('created_at > ?', 1.day.ago)
  end
end
