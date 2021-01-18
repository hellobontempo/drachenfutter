class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  serialize :amount, Array


  
  def display_amount
    self.amount.join(",")
  end

  def find_ingredient
    Ingredient.find_by_id(self.ingredient_id) 
  end

end
