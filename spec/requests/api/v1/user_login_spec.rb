require 'rails_helper'

RSpec.describe 'Users login endpoint' do
  before :each do
    @user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', headers: headers, params: JSON.generate(@user_params)
  end

  it 'can login a user and return that user api key' do
    user_login_params = ({ email: @user_params[:email],
                         password: @user_params[:password]
                      })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)

    user= Users.last

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('users')
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to be_a(String)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it "should return an error message if email is blank" do
    user_login_params = ({ password: @user_params[:password] })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('Please fill in email')
  end

  it "should return an error message if password is blank" do
    user_login_params = ({ email: @user_params[:email] })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('Please fill in password')
  end

  it "should return an error message if password is incorrect" do
    user_login_params = ({ email: @user_params[:email],
                           password: 'coolest@venger' })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('email or password is incorrect')
  end

  it "should return an error message if email is incorrect" do
    user_login_params = ({ email: 'bruce@wayne.com',
                           password: @user_params[:password] })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('email or password is incorrect')
  end
end
