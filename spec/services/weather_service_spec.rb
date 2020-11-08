require 'rails_helper'

RSpec.describe WeatherService do
  it 'should return weather/forecast data for a geolocation', :vcr do
    geolocation = { "lat": 39.739154, "lng": -104.984703 }

    weather = WeatherService.get_weather(geolocation)

    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:current)
    expect(weather).to have_key(:hourly)
    expect(weather).to have_key(:daily)
  end
end
