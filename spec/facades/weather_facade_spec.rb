require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'can return a Forecast object for a city', :vcr do
    city = 'denver, co'

    forecast = WeatherFacade.city_weather(city)

    expect(forecast).to be_a(Forecast)
  end
end
