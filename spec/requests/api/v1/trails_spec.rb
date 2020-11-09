require 'rails_helper'

RSpec.describe 'When given a city and state' do
  it 'it returns json data' do
    city_state = 'denver,co'

    get '/api/v1/trails', params: {location: city_state}

    expect(response).to be_successful
    expect(response.body).to be_a(String)

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
