task :cron => :environment do
  DataDepositor.save_samples_for_all_cities
end
