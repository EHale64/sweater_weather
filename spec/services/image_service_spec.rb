require 'rails_helper'

RSpec.describe ImageService do
  it 'should fetch image data for a city', :vcr do
    city = 'denver,co'

    image_data = ImageService.get_image(city)

    expect(image_data).to be_a(Hash)
    expect(image_data).to have_key(:photos)
    expect(image_data[:photos]).to be_an(Array)
    expect(image_data[:photos][0]).to have_key(:photographer)
    expect(image_data[:photos][0][:photographer]).to be_a(String)
    expect(image_data[:photos][0][:src]).to be_a(Hash)
    expect(image_data[:photos][0][:src]).to have_key(:original)
    expect(image_data[:photos][0][:src][:original]).to be_a(String)
  end
end
