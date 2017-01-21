module Ruboty::LivedoorWeather
  class Client
    def initialize(message)
      @city         = city(message)
      @locations    = locations(message)
      @brain        = message.robot.brain
      @primary_area = retrieve_primary_area
    end

    def report
      request
    end

    private

    def request
      cc = city_code
      return "*#{@city}* の予報は見当たりません。" if cc.nil?

      response = RestClient.get(ENDPOINT, params: { city: cc })
      json = JSON.parse(response)
      forecasts = format_forecasts(json['forecasts'])

      result = [
        "*#{@city}* の天気予報です。",
        forecasts,
        "\n",
        remove_linebreak(json['description']['text']),
      ]

      pinpoint_locations = format_pinpoint_locations(json['pinpointLocations'], @locations)

      unless pinpoint_locations.empty?
        result += ["\n", "【ピンポイント天気】"]
        result += pinpoint_locations
      end

      result.join("\n")
    end

    private

    def city(message)
      message[:city] || ENV['LDW_CITY'] || '東京'
    end

    def locations(message)
      (message[:locations] || ENV['LDW_LOCATIONS'] || '').strip.split(/\s/)
    end

    def city_code
      city = @brain.data[:ldw_primary_area].find { |c| c['title'] == @city }
      city&.fetch('id')
    end

    def format_forecasts(forecasts)
      forecasts.each_with_object([]) { |forecast, r|
        r.push "#{forecast['dateLabel']} #{forecast['telop']} #{format_temperature(forecast['temperature'])}"
      }.join("\n")
    end

    def format_temperature(temp, unit: 'celsius')
      min = temp['min']&.fetch(unit) || '-'
      max = temp['max']&.fetch(unit) || '-'
      "気温:#{min}/#{max} #{unit == 'celsius' ? 'C' : 'F' }"
    end

    def format_pinpoint_locations(data, locations)
      data.find_all { |d|
        locations.include?('all') || locations.include?(d['name'])
      }.map { |d| "#{d['name']} : #{d['link']}" }
    end

    def remove_linebreak(forecast_description)
      forecast_description.gsub(/[^\n。】]\n/) { |m| m.delete("\n") }
    end

    def retrieve_primary_area
      # cache 1.day
      expire = @brain.data[:ldw_primary_area_expire] || 1.day.ago
      @brain.data[:ldw_primary_area] = nil if Time.now > expire

      @brain.data[:ldw_primary_area] ||= Array.new.tap do |r|
        response = RestClient.get(PRIMARY_AREA)
        xml = Nokogiri::XML(response)
        xml.xpath('//ldWeather:source//pref').each do |pref|
          pref.xpath('city').each do |city|
            c = { 'pref' => pref.attr('title') }
            city.attributes.each { |k, _| c[k] = city.attr(k) }
            r.push c
          end
        end
        @brain.data[:ldw_primary_area_expire] = 1.day.since
      end
    end
  end
end
