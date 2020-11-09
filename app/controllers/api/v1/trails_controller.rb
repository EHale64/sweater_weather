class Api::V1::TrailsController < ApplicationController
  def show
    start = params[:location]
    render json: TrailSerializer.new(TrailFacade.get_trails(start))
  end
end
