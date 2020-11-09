class Trail
  attr_reader :name,
              :summary,
              :difficulty,
              :location

  def initialize(trail_params)
    # require "pry"; binding.pry
    @name = trail_params[:name]
    @summary = trail_params[:summary]
    @difficulty = trail_params[:difficulty]
    @location = trail_params[:location]
  end
end
