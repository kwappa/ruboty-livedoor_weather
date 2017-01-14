require 'ruboty'
require 'ruboty/livedoor_weather/version'
require 'ruboty/livedoor_weather/handlers/livedoor_weather'
require 'ruboty/livedoor_weather/client'

module Ruboty
  module LivedoorWeather
    ENDPOINT = 'http://weather.livedoor.com/forecast/webservice/json/v1'
  end
end
