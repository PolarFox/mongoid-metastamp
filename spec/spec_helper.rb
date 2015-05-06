require "rubygems"
require "bundler/setup"
require "zonebie"

require "mongoid"
require "mongoid/metastamp"
require "mongoid/metastamp/time"

require 'database_cleaner'
require 'pry'

require "rspec"

Zonebie.set_random_timezone

Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml", :test)

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

RSpec.configure do |c|
  c.before :all do
    Zonebie.set_random_timezone
  end

  c.before :each do
    DatabaseCleaner.clean
  end
end
