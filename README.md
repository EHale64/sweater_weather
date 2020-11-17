# ReadMe

## Sweater Weather

  Sweater Weather is a backend rails application which builds an aggregates data from various sources and then packages that data into endpoints for a front end to consume. These endpoints allow for a frontend application to find get weather forecasts for a city, get an image for a city, register users, login users, and allow users to set up road trips from one city to another and then providing predicted weather conditions for the destination and the estimated time of arrival.

### System Specifications, API's, and Gems

This project runs on `Ruby 2.5.3` on a `Rails 5.2.4.4` frame work please run `ruby -v` to check your ruby version and `rails -v` to check rails version.

#### API's

This project cosumes external API'S to get the data it needs. Please follow the below links and follow the getting started section on each page to set up an account and API key with each.

[OpenWeather](https://openweathermap.org/): The `OneCall` api endpoint is used to get weather data for locations

[MapQuest Developer](https://developer.mapquest.com/): The `Geocoding` endpoint is used to translate a city or address into a lattitude and longitude pair, and the `Directions` endpoint is used to get drive time data for two locations.

[Pexels API](https://www.pexels.com/api/): The `Search for Photos` endpoint is used to get an image for a location.

#### Gems

There are a few gems you will need to add to you gemfile to run this project.
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)
* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [pry](https://github.com/pry/pry)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [bcrypt](https://github.com/codahale/bcrypt-ruby)


### Set-up

#### Fork AND clone this repo

Fork this repo and then clone it into your terminal by running

`$ git clone git@github.com:<your-github-username>/sweater_weather.git`

#### first time set-up

This project will be running off of a [Postgres](https://www.postgresql.org/) database

After adding all the required gems to your gemfile, In your command line run these commands in order:

1. `$ rails db:{create,migrate}`
2. `$ rails generate rspec:install`
3. `$ bundle exec figaro install`
4. `$ bundle install`

### Testing

Testing in this project is done with `Rspec` with `SimpleCov` checking for test coverage.

#### Running Rspec

In your command line run `$ bundle exec rspec` all tests should pass.  If there are any `vcr` errors please read the [vcr](https://github.com/vcr/vcr) documentation to troubleshoot.


