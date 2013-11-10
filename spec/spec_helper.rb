require 'rspec'
require 'pry'
require 'vcr'
require './lib/rb_weather'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :fakeweb # or :fakeweb
end
