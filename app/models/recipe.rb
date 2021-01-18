class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    

    
    
    def print_ingredient_list
        self.recipe_ingredients.each do |ing|
            i = Ingredient.find_by_id(ing.ingredient_id)
            puts "#{ing.amount.join(",")} - #{i.name}"
        end
    end

end
