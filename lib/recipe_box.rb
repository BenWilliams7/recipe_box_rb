class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes

end

class IngredientsRecipes < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end

class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes

end

class Instruction < ActiveRecord::Base
  belongs_to :recipe
end

class Recipe < ActiveRecord::Base
  has_many :instructions
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :ingredients

end

# class Tag < ActiveRecord::Base
#
# end
