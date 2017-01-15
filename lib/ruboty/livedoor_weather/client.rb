module Ruboty::LivedoorWeather
  class Client
    def initialize(message)
      p message
      @city      = city(message)
      @locations = locations(message)
      @brain     = message.robot.brain
    end

    def report
      request
    end

    private

    def request
      response = RestClient.get(ENDPOINT, params: { city: 130010 })
      json = JSON.parse(response)
      json['description']['text']
    end

    private

    def city(message)
      message[:city] || ENV['LDW_CITY'] || '東京'
    end

    def locations(message)
      (message[:locations] || ENV['LDW_LOCATIONS'] || '').strip.split(/\s/)
    end
  end
end
