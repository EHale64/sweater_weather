class TrailForecast
  attr_reader :location,
              :summary,
              :temperature

  def initialize(location, weather_params)
    @location = location
    current_weather = CurrentWeather.new(weather_params)
    @summary = current_weather.conditions
    @temperature = current_weather.temperature
    # require "pry"; binding.pry
  end
end
