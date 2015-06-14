class RaportLogger

  def initialize(city_name, raport_hash, logger=Rails.logger)
    @city_name = city_name
    @weighted_mean = raport_hash.delete('weighted_mean')
    @raport_hash = raport_hash
    @logger = logger
  end

  def log_report
    @logger.info("Now at #{Time.now}")
    @raport_hash.each do |key, value|
      @logger.info("Location: #{key.to_location}")
      @logger.info("Time: #{value}")
      @logger.info("Traffic load percentage: #{ count_percentage(value, key) }%")
    end

    @logger.info("The average time to get now the center of #{@city_name}:")
    @logger.info(" is #{ weighted_mean_in_minutes } minutes (#{ @weighted_mean } seconds)")
  end

  private

  def weighted_mean_in_minutes
    ( @weighted_mean.to_f / 60 ).round
  end

  def count_percentage(numerator, denominator)
    (numerator.to_f / denominator.time_without_traffic * 100 ).round()
  end

end
