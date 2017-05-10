class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes

end

class Content < ActiveRecord::Base
  belongs_to :recipes
  belongs_to :ingredients
end

class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes

end

class Instruction < ActiveRecord::Base
  belongs_to :recipes
end

class Recipe < ActiveRecord::Base
  has_many :instructions
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :ingredients

end

# class Tag < ActiveRecord::Base
#
# end
