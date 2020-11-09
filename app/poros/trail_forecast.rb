class TrailForecast
  attr_reader :location,
              :summary,
              :temperature

  def initialize(weather_params)
    current_weather = CurrentWeather.new(weather_params)
    @summary = current_weather.conditions
    @temperature = current_weather.temperature
  end
end
