class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(daily_params)
    @date = formatted_time(daily_params[:dt])
    @sunrise = formatted_time(daily_params[:sunrise])
    @sunset = formatted_time(daily_params[:sunset])
    @max_temp = daily_params[:temp][:max]
    @min_temp = daily_params[:temp][:min]
    @conditions = daily_params[:weather][0][:description]
    @icon = daily_params[:weather][0][:icon]
  end

  def formatted_time(iso)
    Time.at(iso)
  end
end
