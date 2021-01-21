class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients, inverse_of: :recipe
    has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :recipe_ingredients, reject_if: proc { |attributes| attributes['amount'].blank? }
    validates_presence_of :title
    validates_presence_of :instructions
  
    def self.search_by_ingredient(query)
        t = query.titlecase
        self.joins(:ingredients).where('ingredients.name = ?', "#{t}") 
    end

    def titlecase_title
        self.title = self.title.titlecase
    end

   
end
