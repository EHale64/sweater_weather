class ImageFacade
  def self.city_image(city)
    image = ImageService.get_image(city)
    Image.new(city, image[:photos][0])
  end
end
