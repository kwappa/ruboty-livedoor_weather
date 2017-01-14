module Ruboty::Handlers
  class LivedoorWeather < Base
    on /livedoor_weather/, name: 'livedoor_weather', description: 'Show weather report from Livedoor Weather'

    def livedoor_weather(message)
      client = Ruboty::LivedoorWeather::Client.new
      message.reply(client.report)
    end
  end
end
