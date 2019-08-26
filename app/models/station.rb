class Station
  attr_reader :distance, :fuel_type, :name, :address, :access_times

  def initialize(data)
    @distance = data[:distance]
    @fuel_type = data[:fuel_type_code]
    @name = data[:station_name]
    @address = make_address(data)
    @access_times = data[:access_days_time]
  end

  def make_address(data)
    street = data[:street_address]
    city = data[:city]
    state = data[:state]
    zip = data[:zip]
    street + city + state + zip
  end
end
