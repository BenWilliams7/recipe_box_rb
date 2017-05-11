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

post "/ingredients" do
  recipe_id = params.fetch("recipe_id")
  recipe = Recipe.find(recipe_id)
  ingredient_name = params.fetch("ingredient-name")
  new_ingredient = Ingredient.create(name: ingredient_name)
  redirect "/recipe/edit/#{recipe_id}"
end

get "/ingredient/:id" do
  ingredient_id = params.fetch("id")
  @ingredient = Ingredient.find(ingredient_id)
  @recipes = Recipe.all
  erb(:ingredient_edit)
end

get "/recipe/edit/:id" do
  recipe_id = params.fetch("id")
  @recipe = Recipe.find(recipe_id)
  erb(:recipe_edit)
end

post "/instructions" do
  recipe_id = params.fetch("recipe_id2")
  recipe = Recipe.find(recipe_id)
  instruction_desc = params.fetch("instruction-desc")
  Instruction.create(name: instruction_desc, recipe_id: recipe_id)
  redirect "/recipe/edit/#{recipe_id}"
end

patch "/ingredient/:id/update" do
  ingredient_name = params.fetch("ingredient-name")
  @ingredient = Ingredient.find(params.fetch("id").to_i)
  @ingredient.update({name: ingredient_name})
  redirect "/recipes"
end

post "/ingredient/project/connector" do
  redirect "/recipes"
end
