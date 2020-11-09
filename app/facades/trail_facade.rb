class TrailFacade
  def self.get_trails(city_state)
    geolocation = GeolocationService.get_geolocation(city_state)
    weather = WeatherService.get_weather(geolocation)

    conn = Faraday.new(url: 'https://www.hikingproject.com') do |f|
      f.params['key'] = ENV['HIKING_API_KEY']
    end

    response = conn.get('/data/get-trails') do |f|
      f.params['maxDistance'] = 10
      f.params['sort'] = 'distance'
      f.params['lat'] = geolocation[:lat]
      f.params['lon'] = geolocation[:lng]
    end

    json = JSON.parse(response.body, symbolize_names: true)

    Trail.new(city_state, weather[:current], json[:trails])
  end
end
