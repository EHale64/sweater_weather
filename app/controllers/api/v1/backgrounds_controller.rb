class Api::V1::BackgroundsController < ApplicationController
  def show
    split = params[:location].split(',')

    conn = Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers['Authorization'] = ENV['IMAGE_API_KEY']
    end

    response = conn.get('/v1/search?query=denver') do |f|
      f.params['query'] = split.first
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
