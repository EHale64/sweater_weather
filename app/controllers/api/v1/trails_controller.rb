class Api::V1::TrailsController < ApplicationController
  def show
    start = params[:location]

    geolocation = GeolocationService.get_geolocation(start)
    weather = WeatherService.get_weather(geolocation)

    conn = Faraday.new(url: 'https://www.hikingproject.com') do |f|
      f.params['key'] = ENV['HIKING_API_KEY']
    end

    response = conn.get('/data/get-trails') do |f|
      f.params['maxDistance'] = 10
      f.params['lat'] = geolocation[:lat]
      f.params['lon'] = geolocation[:lng]
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
