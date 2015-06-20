class ReportLogger

  def initialize(city_name, report, weighted_mean, logger=Rails.logger)
    @city_name = city_name
    @weighted_mean = weighted_mean
    @report = report
    @logger = logger
  end

  def log_report
    @report.each do |key, value|
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
