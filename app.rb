require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/recipe_box'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
