require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'should be an Hourly object' do
    data = {
            "dt": 1604790000,
            "temp": 69.51,
            "feels_like": 54.95,
            "pressure": 998,
            "humidity": 18,
            "dew_point": 25.09,
            "clouds": 81,
            "visibility": 10000,
            "wind_speed": 17.72,
            "wind_deg": 197,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        }

   hourly = HourlyWeather.new(data)

   expect(hourly).to be_a(HourlyWeather)

   expect(hourly.time).to eq(Time.at(data[:dt]))
   expect(hourly.wind_speed).to eq(data[:wind_speed].to_s + ' mph')
   # expect(hourly.wind_direction).to eq('from NW')
   expect(hourly.conditions).to eq(data[:weather][0][:description])
   expect(hourly.icon).to eq(data[:weather][0][:icon])
  end
end
