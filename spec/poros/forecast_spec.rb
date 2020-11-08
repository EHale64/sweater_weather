require 'rails_helper'

RSpec.describe Forecast do
  it 'should be a forcast' do
    data = { current: {
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
        ]
    }, hourly: [
        {
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
        },
        {
            "dt": 1604793600,
            "temp": 68.23,
            "feels_like": 59.74,
            "pressure": 998,
            "humidity": 22,
            "dew_point": 28.44,
            "clouds": 75,
            "visibility": 10000,
            "wind_speed": 7.76,
            "wind_deg": 204,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1604797200,
            "temp": 66.6,
            "feels_like": 56.3,
            "pressure": 999,
            "humidity": 26,
            "dew_point": 30.83,
            "clouds": 17,
            "visibility": 10000,
            "wind_speed": 11.59,
            "wind_deg": 177,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "pop": 0
        }], daily: [
        {
            "dt": 1604772000,
            "sunrise": 1604756162,
            "sunset": 1604793077,
            "temp": {
                "day": 70.09,
                "min": 56.91,
                "max": 70.09,
                "night": 59.65,
                "eve": 68.23,
                "morn": 56.91
            },
            "feels_like": {
                "day": 57.16,
                "night": 50.27,
                "eve": 59.74,
                "morn": 45.88
            },
            "pressure": 1002,
            "humidity": 23,
            "dew_point": 28.24,
            "wind_speed": 16.24,
            "wind_deg": 201,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 87,
            "pop": 0,
            "uvi": 3.29
        },
        {
            "dt": 1604858400,
            "sunrise": 1604842631,
            "sunset": 1604879418,
            "temp": {
                "day": 54.59,
                "min": 48.34,
                "max": 59.67,
                "night": 48.34,
                "eve": 54.5,
                "morn": 54.32
            },
            "feels_like": {
                "day": 45.99,
                "night": 38.91,
                "eve": 38.88,
                "morn": 39.97
            },
            "pressure": 1002,
            "humidity": 28,
            "dew_point": 0.37,
            "wind_speed": 6.78,
            "wind_deg": 154,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 0,
            "pop": 0.43,
            "rain": 0.19,
            "uvi": 2.79
        }]}

    forecast = Forecast.new(data)
    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)

    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather[0]).to be_a(DailyWeather)

    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather[0]).to be_an(HourlyWeather)
  end
end
