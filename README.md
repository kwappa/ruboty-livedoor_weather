# Ruboty::LivedoorWeather

Ruboty handler to show weather forecast from [Weather Hacks](http://weather.livedoor.com/weather_hacks/) by Livedoor.

## Installation

Add this line to your ruboty's Gemfile:

```
gem 'ruboty-livedoor_weather'
```

## Usage


### Simple way

Talk to your ruboty:

```
ruboty livedoor_weather
```

Then shows forecasts specified by `ENV['LDW_CITY']` (default : '東京').

### Specify area

You can specify city to show forecast:

```
ruboty livedoor_weather 種子島
```

### Also sho pinpoint locations

You can specify locations to show URL to pinpoint location page:

```
ruboty livedoor_weather 京都 京都市中京区 長岡京市
```

Show all pinpoint locations if location list includes `all`.

List of cities is [here](http://weather.livedoor.com/forecast/rss/primary_area.xml).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
