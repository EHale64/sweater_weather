require 'rails_helper'

RSpec.describe GeolocationService do
  it "should fetch latitude and longitude data for a given city", :vcr do

      city = 'denver,co'
      geolocation = GeolocationService.get_geolocation(city)
      expect(geolocation).to be_a(Hash)
      expect(geolocation).to have_key(:lat)
      expect(geolocation[:lat]).to eq(39.739154)
      expect(geolocation).to have_key(:lng)
      expect(geolocation[:lng]).to eq(-104.984703)
  end

  it 'should fetch data for a trip from one location to another', :vcr do
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'

    travel_data = GeolocationService.get_travel_data(origin, destination)

    expect(travel_data).to be_a(Hash)
    expect(travel_data).to have_key(:formattedTime)
    expect(travel_data[:formattedTime]).to be_a(String)
    expect(travel_data).to have_key(:locations)
    expect(travel_data[:locations]).to be_an(Array)
    expect(travel_data[:locations][1]).to be_a(Hash)
    expect(travel_data[:locations][1]).to have_key(:latLng)
    expect(travel_data[:locations][1][:latLng]).to be_a(Hash)
  end
end
