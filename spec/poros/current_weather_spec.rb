require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'should be a current weather' do
    data = {
        "dt": 1604791299,
        "sunrise": 1604756162,
        "sunset": 1604793077,
        "temp": 69.51,
        "feels_like": 63.25,
        "pressure": 998,
        "humidity": 18,
        "dew_point": 25.09,
        "uvi": 3.29,
        "clouds": 81,
        "visibility": 10000,
        "wind_speed": 3,
        "wind_deg": 148,
        "wind_gust": 8.01,
        "weather": [
           {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
            }
          ] }

    current_weather = CurrentWeather.new(data)

    expect(current_weather).to be_a(CurrentWeather)

    expect(current_weather.formatted_time(data[:dt])).to eq('2020-11-07 16:21:39 -0700')
    expect(current_weather.date_time).to eq(current_weather.formatted_time(data[:dt]))
    expect(current_weather.sunrise).to eq(current_weather.formatted_time(data[:sunrise]))
    expect(current_weather.sunset).to eq(current_weather.formatted_time(data[:sunset]))
    expect(current_weather.temp).to eq(data[:temp])
    expect(current_weather.feels_like).to eq(data[:feels_like])
    expect(current_weather.humidity).to eq(data[:humidity])
    expect(current_weather.uvi).to eq(data[:uvi])
    expect(current_weather.visibility).to eq(data[:visibility])
    expect(current_weather.conditions).to eq(data[:weather][0][:description])
    expect(current_weather.icon).to eq(data[:weather][0][:icon])
  end
end
