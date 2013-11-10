require 'unirest'
require 'json'
require './lib/rb_weather/current'

module RbWeather
  Wind = Struct.new(:speed, :degrees)
  Weather = Struct.new(:id, :main, :description, :icon)
  Temperature = Struct.new(:kelvin) do
    def to_celsius(precision = 3)
      (kelvin - 273.15).round(precision)
    end

    def to_fahrenheit(precision = 3)
      ( ( ( kelvin - 273.15 ) * 1.8 ) + 32 ).round(precision)
    end
  end
end
