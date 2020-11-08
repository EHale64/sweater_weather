require 'rails_helper'

RSpec.describe 'When given a city and state' do
  it 'returns a weather data as json', :vcr do
    city_state = 'denver,co'

    get '/api/v1/forecast',params: {location: city_state}

    expect(response).to be_successful
    expect(response.body).to be_a(String)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a(Hash)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:current_weather)
    expect(json[:data][:attributes][:current_weather]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:daily_weather)
    expect(json[:data][:attributes][:daily_weather].count).to eq(5)
    expect(json[:data][:attributes][:daily_weather]).to be_an(Array)

    expect(json[:data][:attributes]).to have_key(:hourly_weather)
    expect(json[:data][:attributes][:hourly_weather]).to be_an(Array)
  end

  it 'returns expected data for current_weather', :vcr do
    city_state = 'denver,co'

    get '/api/v1/forecast',params: {location: city_state}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(json[:data][:attributes][:current_weather][:datetime]).to be_a(String)

    expect(json[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(json[:data][:attributes][:current_weather][:sunrise]).to be_a(String)

    expect(json[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(json[:data][:attributes][:current_weather][:sunset]).to be_a(String)

    expect(json[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(json[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)

    expect(json[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(json[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)

    expect(json[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(json[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)

    expect(json[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(json[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)

    expect(json[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(json[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)

    expect(json[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(json[:data][:attributes][:current_weather][:conditions]).to be_a(String)

    expect(json[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(json[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(json[:data][:attributes][:current_weather]).to_not have_key(:pressure)
    expect(json[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(json[:data][:attributes][:current_weather]).to_not have_key(:clouds)
    expect(json[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(json[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
    expect(json[:data][:attributes][:current_weather]).to_not have_key(:weather)
  end

  it 'returns expected data for daily_weather', :vcr do
    city_state = 'denver,co'

    get '/api/v1/forecast',params: {location: city_state}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(json[:data][:attributes][:daily_weather][0][:date]).to be_a(String)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(json[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(json[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(json[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Numeric)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(json[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Numeric)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(json[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)

    expect(json[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(json[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:feels_like)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:humidity)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:weather)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:clouds)
    expect(json[:data][:attributes][:daily_weather][0]).to_not have_key(:uvi)
  end

  it 'does not return extra data for current_weather', :vcr do
    city_state = 'denver,co'

    get '/api/v1/forecast',params: {location: city_state}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(json[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
    expect(json[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Numeric)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:wind_speed)
    expect(json[:data][:attributes][:hourly_weather][0][:wind_speed]).to be_a(String)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:wind_direction)
    expect(json[:data][:attributes][:hourly_weather][0][:wind_direction]).to be_a(String)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(json[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)

    expect(json[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(json[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)

    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:humidity)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:clouds)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:visibility)
    expect(json[:data][:attributes][:hourly_weather][0]).to_not have_key(:weather)
  end
end
