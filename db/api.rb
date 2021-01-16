
require 'rest-client'
require 'nice_hash'

response = RestClient.get "https://www.themealdb.com/api/json/v1/1/random.php"
recipe = JSON.parse(response)["meals"][0]

def createRecipeFromAPI(randRecipe)
    # make a recipe obj to create for our DB
    recipe = Recipe.create(title: recipe["strMeal"], instructions: recipe["strInstructions"], source: recipe["strSource"])
    ing_hash.each do |ing, quantity| 
        ingredient = Ingredient.find_or_create_by(name: ing.titlecase)
        ri = RecipeIngredient.create(recipe: recipe, ingredient: ingredient, quantity: quantity)
    end
end

    ing_hash = Hash[ingredient_array.zip(quantity_array)]


private

def ingredient_array
    ingredients = []
        recipe.each do |key, value| 
            if key.match(/(strIngredient)/) && value != ""
                ingredients << value
            end
        end
    ingredients
end

def quantity_array
    quantities = []
    recipe.each do |key, value| 
        if key.match(/(strMeasure)/) && value != "" && value != " "
            quantities << value
        end
    end
    quantities
end