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
    @forecast = destination_forecast[@hour - 1] unless @travel_time == 'Impossible to Route'
    @weather_at_eta = { temperature: @forecast.temperature, conditions: @forecast.conditions } unless @travel_time == 'Impossible to Route'
  end

  def check_hours(arrival_time)
    time = arrival_time.split(':')
    if time[1].to_i > 30
      time[0].to_i + 1
    else
      time[0].to_i
    end
  end
end
