class Ingredient < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :recipes, through: :recipe_ingredients
    
    validates :name, presence: true
    
    scope :order_by_name, -> {order(:name)}
    scope :search_by_name, -> (query) {where('name LIKE ?', "#{query}%" )}
    
   
end
