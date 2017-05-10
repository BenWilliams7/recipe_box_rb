ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "sinatra/activerecord"
require "recipe_box"

RSpec.configure do |config|
  config.after(:each) do
    # Survey.all.each do |d|
    #   d.destroy
    # end
    # Question.all.each do |d|
    #   d.destroy
    # end
  end
end
