class Image
  attr_reader :location,
              :image_url,
              :credit

  def initialize(location, image_params)
    @location = location
    @image_url = image_params[:src][:original]
    @credit = Credit.new(image_params[:photographer])
  end
end
