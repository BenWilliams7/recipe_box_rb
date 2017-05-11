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
  recipe.ingredients.push(new_ingredient)  #this how to assign to join table!!!! yay!
  redirect "/recipe/edit/#{recipe_id}"
end

get "/ingredient/:id" do
  @ingredient_id = params.fetch("id")
  @ingredient = Ingredient.find(@ingredient_id) #this line is reference to list/loop through anf find all recipies with ingredient
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

post "/ingredient/project/connector/:id" do
  recipe_id = params.fetch('recipe_id') #find recipe id from select hidden input
  recipe = Recipe.find(recipe_id) #find recipe object from id
  ingredient_id = params.fetch('id') #find id from url
  ingredient = Ingredient.find(ingredient_id) #find object from id
  recipe.ingredients.push(ingredient)  #joining recipe object with table ingredients(JOIN) by pusing ingredient object
  redirect "/recipes"
end
