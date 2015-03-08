class CitySerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :center
  has_many :markers, embed: :objects

  # has_many :stats, embed: :objects

  attributes :links

  def links
    {
      stats: url_helpers.city_stats_path(object.id),
    }
  end

  # def stats
  #   object.stats.where('created_at > ?', 1.day.ago)
  # end
end
