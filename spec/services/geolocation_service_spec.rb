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
end
