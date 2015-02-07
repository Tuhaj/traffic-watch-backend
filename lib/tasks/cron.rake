task :cron => :environment do
  GoogleMapDataApi.save_samples_for_all_cities
end
