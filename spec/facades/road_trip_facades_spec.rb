require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'can get a road trip', :vcr do
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'

    road_trip = RoadTripFacade.get_road_trip(origin, destination)

    expect(road_trip).to be_a(RoadTrip)
  end
end
