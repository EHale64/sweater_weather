class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    render json: ImageSerializer.new(ImageFacade.city_image(location))
  end
end
