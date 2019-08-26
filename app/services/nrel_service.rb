class NrelService
  def station_data
    get_json("/nearest.json?")
  end

  private

  def conn
    @_conn ||= Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |faraday|
      faraday.headers["api_key"] = ENV["API_KEY"]
      faraday.headers["fuel_type"] = "LPG,ELEC"
      faraday.headers["location"] = "80203"
      faraday.headers["limit"] = "10"
      faraday.headers["format"] = "JSON"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
