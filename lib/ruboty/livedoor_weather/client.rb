module Ruboty::LivedoorWeather
  class Client
    def initialize(city: '130010')
      @city = city
    end

    def report
      request
    end

    private

    def request
      response = RestClient.get(ENDPOINT, params: { city: @city })
      json = JSON.parse(response)
      json['description']['text']
    end
  end
end
