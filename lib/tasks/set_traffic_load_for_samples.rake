desc "Updates traffic_load for samples. Takes into account records"
desc "created in given number of last days."

task :set_traffic_load_for_samples, [:days] => :environment do |t, args|
  SamplesDataManager.new(args[:days]).set_traffic_load_for_samples
end
