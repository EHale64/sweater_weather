class RoadTripFacade
  def self.get_road_trip(origin, destination)
    travel_data = GeolocationService.get_travel_data(origin, destination)
    eta = travel_data[:formattedTime] ||= 'Impossible to Route'
    destination_lat_lon = travel_data[:locations][1][:latLng] if travel_data[:locations]
    destination_weather = WeatherService.get_weather(destination_lat_lon) if travel_data[:locations]
    destination_forecast = Forecast.new(destination_weather).hourly_weather if travel_data[:locations]
    RoadTrip.new(origin, destination, eta, destination_forecast)
  end
end
