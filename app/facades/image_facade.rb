class ImageFacade
  def self.city_image(city)
    conn = Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers['Authorization'] = ENV['IMAGE_API_KEY']
    end

    response = conn.get('/v1/search?query=denver') do |f|
      f.params['query'] = city.split(',').first
    end

    json = JSON.parse(response.body, symbolize_names: true)

    Image.new(city, json[:photos][0])
  end
end
