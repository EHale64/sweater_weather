require 'rails_helper'

RSpec.describe DailyWeather do
  it 'should be a DailyWeather object' do
    data = {
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
        "weather": [{
                "id": 804,
                "main": "Clouds",
                "description": "overcast clouds",
                "icon": "04d"}],
        "clouds": 87,
        "pop": 0,
        "uvi": 3.29
    }

    daily  = DailyWeather.new(data)

    expect(daily).to be_a(DailyWeather)

    expect(daily.date).to eq(Time.at(data[:dt]))
    expect(daily.sunrise).to eq(Time.at(data[:sunrise]))
    expect(daily.sunset).to eq(Time.at(data[:sunset]))
    expect(daily.max_temp).to eq(data[:temp][:max])
    expect(daily.min_temp).to eq(data[:temp][:min])
    expect(daily.conditions).to eq(data[:weather][0][:description])
    expect(daily.icon).to eq(data[:weather][0][:icon])
  end
end
