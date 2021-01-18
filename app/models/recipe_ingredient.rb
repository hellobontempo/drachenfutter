class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  serialize :amount, Array


  
  def display_amount
    self.amount.join(",")
  end

  def recipe_name
    self.recipe.title
  end

  def ing_name
    self.ingredient.name
  end

  


end
