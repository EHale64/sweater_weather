class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    WeatherFacade.city_weather(location)
  end
end
