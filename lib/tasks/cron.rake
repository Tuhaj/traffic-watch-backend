task :cron => :environment do
  DataFetcher.save_samples_for_all_cities
end
