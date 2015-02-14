task :cron => :environment do
  BingMapDataApi.save_samples_for_all_cities
end
