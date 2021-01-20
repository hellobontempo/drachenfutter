class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    #accepts_nested_attributes_for :ingredients, :allow_destroy => true
    accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true
    validates_presence_of :title
    validates_presence_of :instructions
  
    def self.search_by_ingredient(query)
        t = query.titlecase
        self.joins(:ingredients).where('ingredients.name = ?', "#{t}") 
    end

   
end
