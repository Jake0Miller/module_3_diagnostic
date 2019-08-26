class Station
  def initialize(data)
    @distance = data[:fuel_stations][:distance]
    @fuel_type = data[:fuel_stations][:fuel_type_code]
    @name = data[:fuel_stations][:station_name]
    @address = make_address(data[:fuel_stations])
    @access_times = data[:fuel_stations][:access_days_time]
  end

  def make_address(data)
    street = data[:street_address]
    city = data[:city]
    state = data[:state]
    zip = data[:zip]
    street + city + state + zip
  end
end
