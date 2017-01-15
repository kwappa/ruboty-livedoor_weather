# Ruboty::LivedoorWeather

Ruboty handler to show weather forecast from [Weather Hacks](http://weather.livedoor.com/weather_hacks/) by Livedoor.

## Installation

Add this line to your ruboty's Gemfile:

```
gem 'ruboty-livedoor_weather'
```

## Usage

Talk to your ruboty:

```
ruboty livedoor_weather
```

Then shows forecasts specified by `ENV['LDW_CITY']` (default : '東京').

You can specify city to show forecast:

```
ruboty livedoor_weather 種子島
```

List of cities is [here](http://weather.livedoor.com/forecast/rss/primary_area.xml).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

