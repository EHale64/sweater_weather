require 'rails_helper'

RSpec.describe Location do
  it 'should be a location' do
    latitude_and_logitude = {:lat=>39.739154, :lng=>-104.984703}

    location = Location.new(latitude_and_logitude)
    expect(location).to be_a(Location)
    expect(location.lat).to eq(latitude_and_logitude[:lat])
    expect(location.lng).to eq(latitude_and_logitude[:lng])
  end
end
