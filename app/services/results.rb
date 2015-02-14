class Results

  def self.show(city_name, opts={})
    h = opts[:hours]

    stats = City.find_by_name(city_name).stats
    stats = stats.where('created_at > ?', h.hours.ago ) if h

    stats.each do |stat|
      message = opts[:min] == true ? stat.to_raport_min : stat.to_raport
      puts message
    end
    nil
  end

  def self.show_all_cities(opts={})
    City.all.each do |city|
      puts "________________________________________"
      puts "City #{city.name}"
      show(city.name, opts)
    end
    nil
  end
end
