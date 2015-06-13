class City < ActiveRecord::Base
  has_many :markers
  has_many :stats
  has_many :samples, :through => :markers

  def last_week_stats
    stats.where(created_at: (7.days.ago.midnight)..(Time.new.midnight))
  end
end
