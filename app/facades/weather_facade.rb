class WeatherFacade
  def self.city_weather(city)
    geolocation = GeolocationService.get_geolocation(city)
    weather_data = WeatherService.get_weather(geolocation)
    Forecast.new(weather_data)
  end
end
