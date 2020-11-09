class TrailService
  def self.get_trail_data(geolocation)
    response = conn.get('/data/get-trails') do |f|
      f.params['maxDistance'] = 10
      f.params['sort'] = 'distance'
      f.params['lat'] = geolocation[:lat]
      f.params['lon'] = geolocation[:lng]
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://www.hikingproject.com') do |f|
      f.params['key'] = ENV['HIKING_API_KEY']
    end
  end
end
