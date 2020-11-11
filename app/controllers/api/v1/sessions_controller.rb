class Api::V1::SessionsController < ApplicationController
  def create
    user = Users.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: :created
    elsif params[:email].nil?
      render  json: { message: 'Please fill in email' }, status: :unauthorized
    elsif params[:password].nil?
      render  json: { message: 'Please fill in password' }, status: :unauthorized
    else
      render  json: { message: 'email or password is incorrect' }, status: :unauthorized
    end
  end
end
