class Api::V1::TrailsController < ApplicationController
  def show
    start = params[:location]
    lat_lng = GeolocationService.get_geolocation(start)
    conn = Faraday.new(url: 'https://www.hikingproject.com') do |f|
      f.params['key'] = ENV['HIKING_API_KEY']
    end

    response = conn.get('/data/get-trails') do |f|
      f.params['maxDistance'] = 10
      f.params['lat'] = lat_lng[:lat]
      f.params['lon'] = lat_lng[:lng]
    end
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
