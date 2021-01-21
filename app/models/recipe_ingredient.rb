class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  
  validates :amount, presence: true

  def ingredient_attributes=(attribute_hash) 
    if attribute_hash[:name].present?
      search = attribute_hash[:name].titlecase.singularize 
      ingredient = Ingredient.find_or_create_by(name: "#{search}")
      self.ingredient = ingredient 
    end
  end
  
  def recipe_name
    self.recipe.title
  end

  def ing_name
    self.ingredient.name 
  end

  


end
