class Api::V1::UsersController < ApplicationController
  def create
    user = Users.new(user_params)
    
    if user_params[:email].nil?
      render json: {message: 'Please fill in email'}, status: :unauthorized
    elsif user_params[:password].nil?
      render json: {message: 'Please fill in password'}, status: :unauthorized
    elsif user_params[:password] != user_params[:password_confirmation]
      render json: {message: 'Passwords must match'}, status: :unauthorized
    elsif Users.find_by(email: user_params[:email]) != nil
      render json: {message: 'A user with that email already exists'}, status: :unauthorized
    else user.save
      user.api_key
      render json: UsersSerializer.new(user), status: :created
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
