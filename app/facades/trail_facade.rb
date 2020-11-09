class TrailFacade
  def self.get_trails(city_state)
    geolocation = GeolocationService.get_geolocation(city_state)
    weather = WeatherService.get_weather(geolocation)
    trails = TrailService.get_trail_data(geolocation)
    Trail.new(city_state, weather[:current], trails[:trails])
  end
end
