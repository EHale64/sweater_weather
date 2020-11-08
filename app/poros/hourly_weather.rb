class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(hourly_params)
    @time = formatted_time(hourly_params[:dt])
    @temperature = hourly_params[:temp]
    @wind_speed = hourly_params[:wind_speed].to_s + ' mph'
    @wind_direction = wind_dir(hourly_params[:wind_deg])
    @conditions = hourly_params[:weather][0][:description]
    @icon = hourly_params[:weather][0][:icon]
  end

  def formatted_time(iso)
    Time.at(iso)
  end

  def wind_dir(deg)
    val = (deg/22.5)+0.5
    dir = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
    'from ' + dir[(val % dir.length)]
  end
end
