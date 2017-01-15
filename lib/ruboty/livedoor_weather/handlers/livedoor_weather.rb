module Ruboty::Handlers
  class LivedoorWeather < Base
    on(/livedoor_weather(\s(?<city>\S+)(\s(?<locations>.+\Z)|\Z)|\Z)/, name: 'livedoor_weather', description: 'Show weather report from Livedoor Weather')

    def livedoor_weather(message)
      client = Ruboty::LivedoorWeather::Client.new(message)
      message.reply(client.report)
    end
  end
end
