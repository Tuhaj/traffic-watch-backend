class ReportLogger

  def initialize(city_name, report, weighted_mean, logger=Rails.logger)
    @city_name = city_name
    @weighted_mean = weighted_mean
    @report = report
    @logger = logger
  end

  def log_report
    @report.each do |key, value|
      @logger.info({
        "Location" => key.to_location,
        "Time"     => value,
        "Traffic load percentage" =>
          calculate_percentage(value, key.time_without_traffic)
      })
    end

    @logger.info("The average time to get now the center of #{@city_name}:")
    @logger.info(" is #{ weighted_mean_in_minutes } minutes
      (#{ @weighted_mean } seconds)")
  end

  private

  def weighted_mean_in_minutes
    ( @weighted_mean / 60 ).round
  end

  def calculate_percentage(numerator, denominator)
    (100.0 * numerator / denominator).round
  end

end
