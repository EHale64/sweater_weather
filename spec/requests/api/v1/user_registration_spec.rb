require 'rails_helper'

RSpec.describe 'User endpoint' do
  it 'can register user and generate an API key' do
    user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}


    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    # require "pry"; binding.pry
    json = JSON.parse(response.body, symbolize_names: true)

    user = Users.last

    # expect(response.status).to eq(201)
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
end
