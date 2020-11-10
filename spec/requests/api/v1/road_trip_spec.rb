require 'rails_helper'

RSpec.describe 'Road Trip endpoint' do
  before :each do
    @user_params = ({ email: 'tony@stark.com',
                    password: 'kewlest@venger',
                    password_confirmation: 'kewlest@venger' })
    headers = {'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', headers: headers, params: JSON.generate(@user_params)

    @user_login_params = ({ email: @user_params[:email],
                         password: @user_params[:password]
                      })

    post '/api/v1/sessions', headers: headers, params: JSON.generate(@user_login_params)
    json = JSON.parse(response.body, symbolize_names: true)
    @user = Users.last
  end

  it 'can return data for a road trip', :vcr do
    road_trip_params = ({ origin: 'Denver,CO',
                          destination: 'Pueblo,CO',
                          api_key: @user.api_key })
    headers = {'CONTENT_TYPE' => 'application/json'}

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_params)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to be_a(nil)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:start_city)
    expect(json[:data][:attributes][:start_city]).to be_a(String)

    expect(json[:data][:attributes]).to have_key(:end_city)
    expect(json[:data][:attributes][:end_city]).to be_a(String)

    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)

    expect(json[:data][:attributes]).to have_key(:weather_at_eta)
    expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)

    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)

    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(json[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
