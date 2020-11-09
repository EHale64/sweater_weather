require 'rails_helper'

RSpec.describe 'When given a city and state' do
  it 'returns an image as json', :vcr do
    city_state = 'denver,co'

    get '/api/v1/backgrounds',params: {location: city_state}

    expect(response).to be_successful
    expect(response.body).to be_a(String)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('image')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    
    expect(json[:data][:attributes]).to have_key(:image)
    expect(json[:data][:attributes][:image]).to be_a(Hash)

    expect(json[:data][:attributes][:image]).to have_key(:image_url)
    expect(json[:data][:attributes][:image][:image_url]).to be_a(String)

    expect(json[:data][:attributes][:image]).to have_key(:credit)
    expect(json[:data][:attributes][:image][:credit]).to be_a(Hash)

    expect(json[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(json[:data][:attributes][:image][:credit][:source]).to be_a(String)

    expect(json[:data][:attributes][:image][:credit]).to have_key(:author)
    expect(json[:data][:attributes][:image][:credit][:author]).to be_a(String)

    expect(json[:data][:attributes][:image][:credit]).to have_key(:logo)
    expect(json[:data][:attributes][:image][:credit][:logo]).to be_a(String)
  end
end
