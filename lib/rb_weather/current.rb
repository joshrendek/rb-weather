module RbWeather
  class Current

    attr_reader :latitude, :longitude, :wind, :country, :sunrise, :sunset, :temperature,
                :temperature_max, :temperature_min, :pressure, :sea_level, :ground_level,
                :humidity, :cloudiness, :id, :weather, :location
    def initialize(location)
      self.location = location
      extract_and_update_from_json
    end


    def extract_and_update_from_json
      json = Unirest.get("http://api.openweathermap.org/data/2.5/weather?q=#{location}").body
      self.latitude = json['coord']['lat']
      self.longitude = json['coord']['lon']
      self.wind = Wind.new(json['wind']['speed'], json['wind']['deg'])
      self.weather = json['weather'].map { |w| Weather.new(w['id'], w['main'], w['description'], w['icon']) }
      self.country = json['sys']['country']
      self.sunrise = Time.at(json['sys']['sunrise'])
      self.sunset = Time.at(json['sys']['sunset'])
      self.pressure = json['main']['pressure']
      self.sea_level = json['main']['sea_level']
      self.ground_level = json['main']['grnd_level']
      self.humidity = json['main']['humidity']
      self.cloudiness = json['clouds']['all']
      self.id = json['id']
      self.temperature = Temperature.new(json['main']['temp'])
      self.temperature_max = Temperature.new(json['main']['temp_max'])
      self.temperature_min = Temperature.new(json['main']['temp_min'])
    end

    private
    attr_writer :latitude, :longitude, :wind, :country, :sunrise, :sunset, :temperature,
                :temperature_max, :temperature_min, :pressure, :sea_level, :ground_level,
                :humidity, :cloudiness, :id, :weather, :location
  end

end
