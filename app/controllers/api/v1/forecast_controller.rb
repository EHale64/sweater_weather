class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    render json: ForecastSerializer.new(WeatherFacade.city_weather(location)), status: :ok
  end
end
