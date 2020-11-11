class Api::V1::RoadTripController < ApplicationController
  def create
    user = Users.find_by(api_key: params[:api_key])
    if user
      travel_data = GeolocationService.get_travel_data(params[:origin], params[:destination])
      eta = travel_data[:formattedTime]
      destination_lat_lon = travel_data[:locations][1][:latLng]
      destination_weather = WeatherService.get_weather(travel_data[:locations][1][:latLng])
      destination_forecast = Forecast.new(destination_weather).hourly_weather
      render json: RoadTripSerializer.new(RoadTrip.new(params[:origin], params[:destination], eta, destination_forecast))
    else
      render json: { message: 'no api key' }, status: :unauthorized
    end
  end
end
