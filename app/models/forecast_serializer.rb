class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id{nil}

  attributes :current_weather

  attribute :daily_weather do |object|
    object.daily_weather.first(5)
  end

  attribute :hourly_weather do |object|
    object.hourly_weather.first(8)
  end
end
