class SearchFacade
  def stations
    @stations ||= service.station_data.map {|data| Station.new(data)}
  end

  private

  def service
    @_service ||= NrelService.new
  end

  def station_data
    @_station_data ||= service.station_data
  end
end
