ENV["RACK_ENV"] = "test"

require "rspec"
require "pg"
require "pry"
require "shoulda-matchers"
require "sinatra/activerecord"
require "recipe_box"

RSpec.configure do |config|
  config.after(:each) do
    Recipe.all.each do |recipe|
      recipe.destroy
    end

    Category.all.each do |category|
      category.destroy
    end
    Ingredient.all.each do |ingredient|
      ingredient.destroy
    end
    Instruction.all.each do |instruction|
      instruction.destroy
    end
  end
end
