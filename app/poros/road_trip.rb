class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, end_city, travel_time, destination_forecast)
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    @hour = check_hours(travel_time)
    @forecast = destination_forecast[@hour + 1]
    @weather_at_eta = { temperature: @forecast.temperature, conditions: @forecast.conditions }
  end

  def check_hours(arrival_time)
    if arrival_time.to_time.min > 30
      arrival_time.to_time.hour + 1
    else
      arrival_time.to_time.hour
    end
  end
end
