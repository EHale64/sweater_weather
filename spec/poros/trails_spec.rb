require 'rails_helper'

RSpec.describe Trails do
  it 'should be a trail object' do
    from = 'denver,co'
    data = {
            "id": 7006781,
            "name": "Dakota Ridge to Sanitas Valley Loop",
            "type": "Recommended Route",
            "summary": "A technical ascent with a great view of Boulder, followed by a nice, open downhill pitch.",
            "difficulty": "blue",
            "stars": 4,
            "starVotes": 8,
            "location": "Boulder, Colorado",
            "url": "https://www.hikingproject.com/trail/7006781/dakota-ridge-to-sanitas-valley-loop",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/hike/7000176_sqsmall_1554158942.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/hike/7000176_small_1554158942.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/hike/7000176_smallMed_1554158942.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/hike/7000176_medium_1554158942.jpg",
            "length": 2.3,
            "ascent": 458,
            "descent": -458,
            "high": 5961,
            "low": 5503,
            "longitude": -105.2942,
            "latitude": 40.0207,
            "conditionStatus": "Unknown",
            "conditionDetails": nil,
            "conditionDate": "1970-01-01 00:00:00"
        }

    trail = Trails.new(data, from)

    expect(trail).to be_a(Trails)
    expect(trail.name).to eq(data[:name])
    expect(trail.summary).to eq(data[:summary])
    expect(trail.difficulty).to eq(data[:difficulty])
    expect(trail.location).to eq(data[:location])
    expect(trail.distance_to_trail).to be_a(Numeric)
  end
end
