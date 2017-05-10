require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/recipe_box'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipe_message = Recipe.all.length > 0 ? "Select a recipe" : "Add a recipe below"
  erb :recipe
end

post "/recipes" do
  recipe_name = params.fetch("recipe-name")
  Recipe.create({name: recipe_name})
  redirect "/recipes"
end

get "/recipe/:id" do
  recipe_id = params.fetch("id")
  @recipe = Recipe.find(recipe_id)
  erb(:recipe_edit)
end
