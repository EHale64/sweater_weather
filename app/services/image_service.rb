class ImageService
  def self.get_image(city)
    response = conn.get('/v1/search?query=denver') do |f|
      f.params['query'] = city.split(',').first
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers['Authorization'] = ENV['IMAGE_API_KEY']
    end
  end
end
