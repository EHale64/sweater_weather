require 'rails_helper'

RSpec.describe ImageFacade do
  it 'should return an Image object for a city', :vcr do
    city = 'denver,co'

    image = ImageFacade.city_image(city)

    expect(image).to be_an(Image)
  end
end
