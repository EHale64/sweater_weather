class Trail
  attr_reader :location,
              :forecast,
              :trails

  def initialize(location, forecast, trails)
    @location = location
    @forecast = TrailForecast.new(forecast)
    @trails = all_trails(trails)
  end

  def all_trails(array_of_trails)
    array_of_trails.map do |trail|
      Trails.new(trail, location)
    end
  end
end
