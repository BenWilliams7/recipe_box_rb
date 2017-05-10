ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "shoulda-matchers"
require "sinatra/activerecord"
require "recipe_box"

RSpec.configure do |config|
  config.after(:each) do

  end
end
