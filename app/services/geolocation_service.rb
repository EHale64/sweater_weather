class GeolocationService
  def self.get_geolocation(city)
    response = conn.get('geocoding/v1/address') do |f|
      f.params['location'] = city
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]
  end

  def self.conn
    Faraday.new(url: 'http://open.mapquestapi.com/') do |f|
      f.params['key'] = ENV['GEOLOCATION_API_KEY']
    end
  end
end