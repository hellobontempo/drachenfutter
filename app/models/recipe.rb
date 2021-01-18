class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
 
  
    def self.search_by_ingredient(query)
        t = query.titlecase
        self.joins(:ingredients).where('ingredients.name = ?', "#{t}")
    end
end
