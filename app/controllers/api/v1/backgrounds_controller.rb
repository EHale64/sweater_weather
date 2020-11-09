class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]

    conn = Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers['Authorization'] = ENV['IMAGE_API_KEY']
    end

    response = conn.get('/v1/search?query=denver') do |f|
      f.params['query'] = location.split(',').first
    end

    json = JSON.parse(response.body, symbolize_names: true)

    render json: ImageSerializer.new(Image.new(location, json[:photos][0]))
  end
end
