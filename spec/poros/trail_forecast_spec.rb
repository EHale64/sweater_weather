require 'rails_helper'

RSpec.describe TrailForecast do
  it 'should be a trail forecast object' do
    location = 'denver,co'

    data = {
        "dt": 1604802998,
        "sunrise": 1604756162,
        "sunset": 1604793077,
        "temp": 61.36,
        "feels_like": 50.16,
        "pressure": 1000,
        "humidity": 29,
        "dew_point": 29.23,
        "uvi": 2.77,
        "clouds": 40,
        "visibility": 10000,
        "wind_speed": 12.75,
        "wind_deg": 180,
        "weather": [
            {
                "id": 802,
                "main": "Clouds",
                "description": "scattered clouds",
                "icon": "03n"
            }
        ]
    }

    trail_forecast = TrailForecast.new(location, data)

    expect(trail_forecast).to be_a(TrailForecast)
    expect(trail_forecast.location).to eq(location)
    expect(trail_forecast.summary).to eq(data[:weather][0][:description])
    expect(trail_forecast.temperature).to eq(data[:temp])
  end
end
