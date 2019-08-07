require 'optparse'
require_relative 'lib/client'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: app.rb [options]"

  opts.on('-cCITY', '--city=CITY', 'The city to query the weather') do |city|
    options[:city] = city
  end
end.parse!

weather = Client.new.query(options[:city])

puts weather.main['temp']
