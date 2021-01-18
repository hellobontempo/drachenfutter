class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  serialize :amount, Array


  
  def display_amount
    self.amount.join(",")
  end

end
