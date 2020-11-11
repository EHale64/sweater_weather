class Api::V1::RoadTripController < ApplicationController
  def create
    user = Users.find_by(api_key: params[:api_key])
    if params[:origin].nil?
      render json: { message: 'please give an origin' }, status: :unauthorized
    elsif params[:destination].nil?
      render json: { message: 'please give a destination' }, status: :unauthorized
    elsif user
      render json: RoadTripSerializer.new(RoadTripFacade.get_road_trip(params[:origin], params[:destination])), status: :created
    else
      render json: { message: 'bad credentials' }, status: :unauthorized
    end
  end
end
