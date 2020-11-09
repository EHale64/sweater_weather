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

  it 'should get the distance between two points' do
    from = 'denver,co'
    to = 'Boulder, Colorado'

    distance = GeolocationService.get_distance(from, to)

    expect(distance).to be_a(Numeric)
    expect(distance).to eq(28.536)
  end
end
