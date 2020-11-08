class WeatherFacade
  def self.city_weather(city)
    geolocation = GeolocationService.get_geolocation(city)

    conn2 = Faraday.new(url:'https://api.openweathermap.org/') do |f|
      f.params['appid'] = ENV['WEATHER_API_KEY']
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
    end

    response = conn2.get('data/2.5/onecall') do |f|
      f.params['lat'] = geolocation[:lat]
      f.params['lon'] = geolocation[:lng]
    end
    json = JSON.parse(response.body, symbolize_names: true)

    Forecast.new(json)
  end
end
