class Ingredient < ApplicationRecord
    has_many :recipe_ingredients, inverse_of: :ingredient
    has_many :recipes, through: :recipe_ingredients
    scope :order_by_name, -> {order(:name)}
  
    
   
end
