class Api::V1::RoadTripController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]


    require "pry"; binding.pry
  end
end
