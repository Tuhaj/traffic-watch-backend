class SamplesDataManager

  def initialize(days, logger=Rails.logger)
    from_date = days.to_i.days.ago
    @samples = Sample.where( created_at: (from_date)..( Time.now() ) )
    @logger = logger
  end

  def set_traffic_load_for_samples
    @logger.info "beginning the traffic_load update of #{@samples.count} samples"
    counter = 0

    @samples.find_in_batches(batch_size: 1000).with_index do |samples, index|
      @logger.info "Processing group: #{index}"
      samples.each do |sample|
        time_without_traffic = sample.marker.time_without_traffic.to_i
        if time_without_traffic != 0
          load = sample.time.to_f / time_without_traffic
          load = (load * 100).round()
          counter += 1 if sample.update(traffic_load: load)
        else
          @logger.error("The marker for sample with id: #{sample.id} ")
          @logger.error('has time_without_traffic equal zero')
        end
      end
    end
    @logger.info "From #{ @samples.count } given samples"
    @logger.info "updated where: #{ counter }"
  end
end
