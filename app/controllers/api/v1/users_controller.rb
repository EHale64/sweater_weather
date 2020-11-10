class Api::V1::UsersController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = Users.new(user_params)
    user.save
    user.api_key
    render json: UsersSerializer.new(user), status: :created
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
