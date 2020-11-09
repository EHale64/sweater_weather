require 'rails_helper'

RSpec.describe Trail do
  it 'should be a trail' do
    location = 'denver,co'
    weather = {
        "dt": 1604802998,
        "sunrise": 1604756162,
        "sunset": 1604793077,
        "temp": 61.36,
        "feels_like": 50.16,
        "pressure": 1000,
        "humidity": 29,
        "dew_point": 29.23,
        "uvi": 2.77,
        "clouds": 40,
        "visibility": 10000,
        "wind_speed": 12.75,
        "wind_deg": 180,
        "weather": [
            {
                "id": 802,
                "main": "Clouds",
                "description": "scattered clouds",
                "icon": "03n"
            }
        ]
    }

    trails = [{
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
        },
        {
            "id": 7000000,
            "name": "Mount Sanitas Loop",
            "type": "Recommended Route",
            "summary": "Very popular and scenic loop right from the edge of town.",
            "difficulty": "blueBlack",
            "stars": 4.1,
            "starVotes": 110,
            "location": "Boulder, Colorado",
            "url": "https://www.hikingproject.com/trail/7000000/mount-sanitas-loop",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/hike/7039883_sqsmall_1555092747.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/hike/7039883_small_1555092747.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/hike/7039883_smallMed_1555092747.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/hike/7039883_medium_1555092747.jpg",
            "length": 3.2,
            "ascent": 1281,
            "descent": -1280,
            "high": 6780,
            "low": 5521,
            "longitude": -105.2977,
            "latitude": 40.0202,
            "conditionStatus": "All Clear",
            "conditionDetails": "Dry",
            "conditionDate": "2020-10-14 19:04:37"
        },
        {
            "id": 7004226,
            "name": "Sunshine Lion's Lair Loop",
            "type": "Recommended Route",
            "summary": "Great Mount Sanitas views are the reward for this gentler loop in Sunshine Canyon.",
            "difficulty": "blue",
            "stars": 4.5,
            "starVotes": 119,
            "location": "Boulder, Colorado",
            "url": "https://www.hikingproject.com/trail/7004226/sunshine-lions-lair-loop",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/hike/7039883_sqsmall_1555092747.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/hike/7039883_small_1555092747.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/hike/7039883_smallMed_1555092747.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/hike/7039883_medium_1555092747.jpg",
            "length": 5.3,
            "ascent": 1261,
            "descent": -1282,
            "high": 6800,
            "low": 5530,
            "longitude": -105.2979,
            "latitude": 40.02,
            "conditionStatus": "All Clear",
            "conditionDetails": "Dry",
            "conditionDate": "2020-10-19 15:37:52"
        },
        {
            "id": 7053374,
            "name": "Indian Peaks Traverse (IPT)",
            "type": "Recommended Route",
            "summary": "An epic, long distance trail connecting Boulder to Winter Park, and one that is in the process of substantial upgrades!",
            "difficulty": "blueBlack",
            "stars": 4.3,
            "starVotes": 3,
            "location": "Boulder, Colorado",
            "url": "https://www.hikingproject.com/trail/7053374/indian-peaks-traverse-ipt",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/hike/7017003_sqsmall_1554828628.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/hike/7017003_small_1554828628.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/hike/7017003_smallMed_1554828628.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/hike/7017003_medium_1554828628.jpg",
            "length": 71.2,
            "ascent": 9173,
            "descent": -5813,
            "high": 11665,
            "low": 5425,
            "longitude": -105.2946,
            "latitude": 40.0137,
            "conditionStatus": "Unknown",
            "conditionDetails": nil,
            "conditionDate": "1970-01-01 00:00:00"
        }]
    trail = Trail.new(location, weather, trails)

    expect(trail).to be_a(Trail)
    expect(trail.location).to eq(location)
    expect(trail.forecast).to be_a(TrailForecast)
    expect(trail.trails).to be_an(Array)
    expect(trail.trails[0]).to be_a(Trails)
  end
end
