require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe "it tests the ingredient path", {:type => :feature} do
  it("adds an ingredient to a recipe") do
    visit '/'
    click_link("View Recipes")
    fill_in("recipe-name", :with => "cookie2")
    click_button("Add Recipe")
    click_link("cookie2")
    fill_in("ingredient-name", :with => "sugar")
    click_button("Add Ingredient")
    expect(page).to have_content("sugar")
  end
end

# describe("the phrase parser path", {:type => :feature}) do
#   it("processes the user input and returns correct message if its a palindrome") do
#     visit("/")
#     fill_in("phrase1", :with => "madam")
#     fill_in("phrase2", :with => "anagram")
#     click_button("what am i?")
#     expect(page).to have_content("'madam' is a palindrome")
#   end
# end
