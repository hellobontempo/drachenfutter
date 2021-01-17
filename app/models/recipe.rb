class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #has_many :measurements, through: :ingredients

    
    
    # get measurements and ingredients where recipe_id 


end
