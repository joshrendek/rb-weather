# RbWeather [![Build Status](https://travis-ci.org/joshrendek/rb-weather.png?branch=master)](https://travis-ci.org/joshrendek/rb-weather)

A simple OpenWeatherMap client to interact with their current weather API

# Usage

```
weather = RbWeather::Current.new('Clearwater, FL')

weather.humidity #=> 100 [ meaning 100% ]
```

# License

MIT License

# Contributing

Fork the code, make a pull request, make sure specs pass

# Running Tests

`rspec`
