require "spec_helper"

describe Category do
  it { should have_and_belong_to_many(:recipes) }
end

describe Instruction do
  it { should belong_to :recipe}
end

describe Recipe do
  it { should have_and_belong_to_many :categories}
  it { should have_and_belong_to_many :ingredients}
  it { should have_many :instructions}
end

describe Ingredient do
  it { should have_and_belong_to_many :recipes}
end
