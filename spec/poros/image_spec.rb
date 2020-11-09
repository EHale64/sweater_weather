require 'rails_helper'

RSpec.describe Image do
  it 'should be a Image' do
    city_state = 'denver,co'
    data = {
            "id": 2706750,
            "width": 6240,
            "height": 4160,
            "url": "https://www.pexels.com/photo/union-station-building-2706750/",
            "photographer": "Thomas Ward",
            "photographer_url": "https://www.pexels.com/@thomasleeward",
            "photographer_id": 220769,
            "src": {
                "original": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg",
                "large2x": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                "large": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
                "medium": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&h=350",
                "small": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&h=130",
                "portrait": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                "landscape": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                "tiny": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false
        }

    image = Image.new(city_state, data)

    expect(image).to be_an(Image)
    expect(image.id).to eq(nil)
    expect(image.location).to eq(city_state)
    expect(image.image_url).to eq(data[:src][:original])
    expect(image.credit).to be_a(Credit)
    expect(image.credit.source).to eq('pexels.com')
    expect(image.credit.author).to eq(data[:photographer])
    expect(image.credit.logo).to eq('https://theme.zdassets.com/theme_assets/9028340/1e73e5cb95b89f1dce8b59c5236ca1fc28c7113b.png')
  end
end
