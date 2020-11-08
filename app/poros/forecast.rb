class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(forecast_params)
    @current_weather = CurrentWeather.new(forecast_params[:current])
    @daily_weather = daily_forecasts(forecast_params[:daily])
    @hourly_weather = hourly_forecasts(forecast_params[:hourly])
  end

  def daily_forecasts(daily_params)
    daily_params.map do |day|
      DailyWeather.new(day)
    end
  end

  def hourly_forecasts(hourly_params)
    hourly_params.map do |hour|
      HourlyWeather.new(hour)
    end
  end
end
