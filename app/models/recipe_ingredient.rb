class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  serialize :amount, Array
  accepts_nested_attributes_for :ingredient, :allow_destroy => true, reject_if: proc { |attributes| attributes['name'].blank? }


 # Ingredient.find_or_create_by_name(:name => "ingredient_attributes[name]")

  # def find_or_create_ingredient
  #   search = self.ing_name.titlecase.singularize
  #   ing = Ingredient.find_or_create_by(name: search)
  #   self.ingredient = ing
  # end
  
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
