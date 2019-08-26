class NrelService
  def station_data
    get_json("/api/alt-fuel-stations/v1/nearest.json?")
  end

  private

  def conn
    @_conn ||= Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params["api_key"] = ENV["API_KEY"]
      faraday.params["fuel_type"] = "LPG,ELEC"
      faraday.params["location"] = "80203"
      faraday.params["limit"] = "10"
      faraday.params["format"] = "JSON"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
