require 'dotenv'
require 'json'
require 'ostruct'
require 'rest-client'

Dotenv.load

class Client
  BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'.freeze

  def query(location)
    response = make_request(build_params_for(location))
    OpenStruct.new(JSON.parse(response))
  end

  private

  def make_request(params)
    RestClient.get(BASE_URL, { params: params })
  end

  def build_params_for(location)
    {
      q: location,
      appid: ENV['APP_ID'],
      units: 'metric'
    }
  end
end
