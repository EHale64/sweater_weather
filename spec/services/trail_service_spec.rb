require 'rails_helper'

RSpec.describe TrailService do
  it 'should return trail data' do
    geolocation = { "lat": 39.739154, "lng": -104.984703 }

    trail_data = TrailService.get_trail_data(geolocation)

    expect(trail_data).to be_a(Hash)
    expect(trail_data).to have_key(:trails)
    expect(trail_data[:trails]).to be_an(Array)
    expect(trail_data[:trails][0]).to be_a(Hash)
    expect(trail_data[:trails][0]).to have_key(:name)
    expect(trail_data[:trails][0][:name]).to be_a(String)
    expect(trail_data[:trails][0]).to have_key(:summary)
    expect(trail_data[:trails][0][:summary]).to be_a(String)
    expect(trail_data[:trails][0]).to have_key(:difficulty)
    expect(trail_data[:trails][0][:difficulty]).to be_a(String)
    expect(trail_data[:trails][0]).to have_key(:location)
    expect(trail_data[:trails][0][:location]).to be_a(String)
  end
end
