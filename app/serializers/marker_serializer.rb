class MarkerSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :lat, :lng, :time_without_traffic

  # has_many :samples, embed: :objects # used when the ralation was not async

  # Attributes computed by serializer
  attributes :links

  def links
    {
      samples: url_helpers.marker_samples_path(object),

    }
  end
end
