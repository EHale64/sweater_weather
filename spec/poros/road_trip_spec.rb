require 'rails_helper'

RSpec.describe RoadTrip do
  it 'should be a roadtrip', :vcr do
    from = 'Denver,CO'
    to = 'Pueblo,CO'
    travel_time = '02:13:00'
    travel_data = GeolocationService.get_travel_data(from, to)
    destination_weather = WeatherService.get_weather(travel_data[:locations][1][:latLng])
    destination_forecast = Forecast.new(destination_weather).hourly_weather
    road_trip = RoadTrip.new(from, to, travel_time, destination_forecast)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(from)
    expect(road_trip.end_city).to eq(to)
    expect(road_trip.travel_time).to eq(travel_time)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta).to have_key(:temperature)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(road_trip.weather_at_eta).to have_key(:conditions)
    expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
