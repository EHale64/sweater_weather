class Location
  attr_reader :lat, :lng

  def initialize(location_params)
    @lat = location_params[:lat]
    @lng = location_params[:lng]
  end
end
