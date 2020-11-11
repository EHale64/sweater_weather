class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, end_city, travel_time, destination_forecast)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    @hour = check_hours(travel_time)
    @forecast = destination_forecast[@hour + 1]
    @weather_at_eta = { temperature: @forecast.temperature, conditions: @forecast.conditions }
  end

  def check_hours(arrival_time)
    time = arrival_time.to_time
    if time.min > 30
      time.hour + 1
    else
      time.hour
    end
  end
end
