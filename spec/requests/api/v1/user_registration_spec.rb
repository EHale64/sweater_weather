require 'rails_helper'

RSpec.describe 'Users endpoint' do
  it 'can register user and generate an API key' do
    user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}


    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    json = JSON.parse(response.body, symbolize_names: true)

    user = Users.last

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a(Hash)
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
    expect(json[:data][:attributes]).to_not have_key(:password)
  end

  it 'should not register a user with no email' do
    user_params = ({ password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    json = JSON.parse(response.body, symbolize_names: true)


    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('Please fill in email')
  end

  it 'should not register a user with no password' do
    user_params = ({ email: 'tony@stark.com' })
    headers = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    json = JSON.parse(response.body, symbolize_names: true)


    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('Please fill in password')
  end

  it 'should not register a user with passwords that do not match' do
    user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'coolest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    json = JSON.parse(response.body, symbolize_names: true)


    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('Passwords must match')
  end

  it 'should not register if that user already has an account with the given email' do
    user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    json = JSON.parse(response.body, symbolize_names: true)


    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(json).to have_key(:message)
    expect(json[:message]).to eq('A user with that email already exists')
  end
end
