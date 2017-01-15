require 'json'
require 'nokogiri'
require 'rest-client'

require 'ruboty'
require 'ruboty/livedoor_weather/version'
require 'ruboty/livedoor_weather/handlers/livedoor_weather'
require 'ruboty/livedoor_weather/client'

module Ruboty
  module LivedoorWeather
    ENDPOINT     = 'http://weather.livedoor.com/forecast/webservice/json/v1'
    PRIMARY_AREA = 'http://weather.livedoor.com/forecast/rss/primary_area.xml'
  end
end
