require 'vcr'
require_relative '../lib/client'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<APP_ID>') { ENV['APP_ID'] }
end

describe Client do
  it 'queries the weather for a given location' do
    VCR.use_cassette("weather") do
      client  = Client.new
      weather = client.query('Latacunga')
      puts weather
      expect(weather.main['temp']).to eq(17.28)
    end
  end
end
