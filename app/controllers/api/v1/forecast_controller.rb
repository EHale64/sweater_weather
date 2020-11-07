class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]

    conn = Faraday.new(url: 'http://open.mapquestapi.com/') do |f|
      f.params['key'] = ENV['GEOLOCATION_API_KEY']
    end

    response = conn.get('geocoding/v1/address') do |f|
      f.params['location'] = location
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]

    conn2 = Faraday.new(url:'https://api.openweathermap.org/') do |f|
      f.params['appid'] = ENV['WEATHER_API_KEY']
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
    end

    response2 = conn2.get('data/2.5/onecall') do |f|
      f.params['lat'] = json[:results][0][:locations][0][:latLng][:lat]
      f.params['lon'] = json[:results][0][:locations][0][:latLng][:lng]
    end
    json2 = JSON.parse(response.body, symbolize_names: true)
  end
end
