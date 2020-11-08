class WeatherService
  def self.get_weather(geolocation)
    response = conn.get('data/2.5/onecall') do |f|
      f.params['lat'] = geolocation[:lat]
      f.params['lon'] = geolocation[:lng]
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url:'https://api.openweathermap.org/') do |f|
      f.params['appid'] = ENV['WEATHER_API_KEY']
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
    end
  end
end
