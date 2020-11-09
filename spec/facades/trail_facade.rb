require 'rails_helper'

RSpec.describe TrailFacade do
  it 'can return a Trail object' do
    city_state = 'denver,co'

    trial = TrailFacade.get_trails(city_state)

    expect(trail).to be_a(Trail)
  end
end
