class CurrentWeather
  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(current_params)
    @date_time = formatted_time(current_params[:dt])
    @sunrise = formatted_time(current_params[:sunrise])
    @sunset = formatted_time(current_params[:sunset])
    @temp = current_params[:temp]
    @feels_like = current_params[:feels_like]
    @humidity = current_params[:humidity]
    @uvi = current_params[:uvi]
    @visibility = current_params[:visibility]
    @conditions = current_params[:weather][0][:description]
    @icon = current_params[:weather][0][:icon]
  end

  def formatted_time(iso)
    Time.at(iso)
  end
end
