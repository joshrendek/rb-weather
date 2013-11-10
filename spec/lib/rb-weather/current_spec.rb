require 'spec_helper'

describe RbWeather::Current do
  subject do
    VCR.use_cassette('weather') { RbWeather::Current.new('Clearwater, FL') }
  end
  its(:latitude) { should == 27.9656 }
  its(:longitude) { should == -82.7998 }
  its(:country) { should == "United States of America" }
  its(:sunrise) { should == Time.at(1384084175) }
  its(:sunset) { should == Time.at(1384123250) }
  its(:pressure) { should == 1033.41 }
  its(:sea_level) { should == 1034.17 }
  its(:ground_level) { should == 1033.41 }
  its(:humidity) { should == 100 }
  its(:cloudiness) { should == 44 }
  its(:id) { should == 4151316 }
  its(:location) { should == "Clearwater, FL" }

  it "should have a current temp" do
    temp = subject.temperature
    temp.to_celsius.should == 19.683
    temp.to_fahrenheit.should == 67.429
  end

  its(:temperature_min) { should == RbWeather::Temperature.new(292.833) }
  its(:temperature_max) { should == RbWeather::Temperature.new(292.833) }

  it "should have wind degrees and speed" do
    subject.wind.speed.should == 4.2
    subject.wind.degrees.should == 40.5013
  end

  it "should have cloudy weather" do
    weather = subject.weather.first
    weather.description.should == "scattered clouds"
    weather.main.should == "Clouds"
    weather.icon.should == "03d"
    weather.id.should == 802
  end

end
