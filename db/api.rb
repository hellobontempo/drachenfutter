
require 'rest-client'
require 'nice_hash'

#returns random recipe
# def get_random_recipe
#     response = RestClient.get "https://www.themealdb.com/api/json/v1/1/random.php"
#     @api_recipe = JSON.parse(response)["meals"][0]
# end

#ingredient_hash

def create_random_recipe 
    ingredients = []
    measurements = []
    response = RestClient.get "https://www.themealdb.com/api/json/v1/1/random.php"
    api_recipe = JSON.parse(response)["meals"][0]
    @recipe = Recipe.create(title: api_recipe["strMeal"], instructions: api_recipe["strInstructions"], source: api_recipe["strSource"])
    api_recipe.each do |key, value| 
        if key.match(/(strIngredient)/) && value != "" && value != nil
            ingredients << value
        elsif key.match(/(strMeasure)/) && value != "" && value != nil
            measurements << value
        end
    end
    ing_hash = Hash[ingredients.zip(measurements)]  
    ing_hash.each do |ing, mes| 
        @ingredient = Ingredient.find_or_create_by(name: ing.titlecase)
        Measurement.create(ingredient: @ingredient, amount: mes)
        ri = RecipeIngredient.create(ingredient: @ingredient, recipe: @recipe)
    end
end





def create_recipe(api_recipe)
    @recipe = Recipe.create(title: api_recipe["strMeal"], instructions: api_recipe["strInstructions"], source: api_recipe["strSource"])
    ingredient_measurement_hash.each do |ing, mes| 
        @ingredient = Ingredient.find_or_create_by(name: ing.titlecase)
        Measurement.create(ingredient: @ingredient, amount: mes)
        ri = RecipeIngredient.create(ingredient: @ingredient, recipe: @recipe)
    end
   
end

