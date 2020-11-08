class HourlyWeather
  attr_reader :time,
              :wind_speed,
              :conditions,
              :icon

  def initialize(hourly_params)
    @time = formatted_time(hourly_params[:dt])
    @wind_speed = hourly_params[:wind_speed].to_s + ' mph'
    @wind_direction = hourly_params[:wind_deg]
    @conditions = hourly_params[:weather][0][:description]
    @icon = hourly_params[:weather][0][:icon]
  end

  def formatted_time(iso)
    Time.at(iso)
  end

  # def degrees_to_directions(deg)
  #   if deg <
  #
  #   end
  # end
end
