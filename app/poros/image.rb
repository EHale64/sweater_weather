class Image
  attr_reader :id,
              :image,
              :location,
              :image_url,
              :credit

  def initialize(location, image_params)
    @id = nil
    @location = location
    @image_url = image_params[:src][:original]
    @credit = Credit.new(image_params[:photographer])
  end
end
