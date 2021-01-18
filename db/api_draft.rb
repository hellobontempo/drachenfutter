 # /\d+/- collects any digits 1-99

recipe.nice_filter(['strMeal', 'strInstructions', 'strSource'])

instructions.gsub(/\r\n?/, " ") # remove from instructions


#combines two arrays into one
ing_array = ingredients.zip(measurements)
 => [["Cream Cheese", "1 1/4 oz "], 
 ["Sugar", "1 1/4 cup"], 
 ["Vanilla Extract", "1 teaspoon"], 
 ["Flour", "2"], 
 ["Puff Pastry", nil], 
 ["Strawberries", nil], 
 ["Raspberries", nil], 
 ["Blackberries", nil]] 

# creates a new hash, setting keys equal to an empty array and THEN shovels ingredient into newly created hash, 
#because keys can't be identical, amounts with matching ingredients get shoveled into the same array
ing_array.each_with_object(Hash.new { |ing,amt| ing[amt]=[] }) { |(amt_1,amt_2),ing| ing[amt_1] << amt_2 }

#transform original array into hash
#for each nested array make element[0] is the key and all subsequent indices values => |(values, values),ing_key|
ing_amount = ing_array.each_with_object({}) { |(amt,amt_2),ing_key| (ing_key[amt] ||= []) << amt_2 }
=> 
{"Cream Cheese"=>["1 1/4 oz "],
 "Sugar"=>["1 1/4 cup"],
 "Vanilla Extract"=>["1 teaspoon"],
 "Flour"=>["2"],
 "Puff Pastry"=>[nil],
 "Strawberries"=>[nil],
 "Raspberries"=>[nil],
 "Blackberries"=>[nil]}

# def create_recipe(api_recipe)
#     @recipe = Recipe.create(title: api_recipe["strMeal"], instructions: api_recipe["strInstructions"], source: api_recipe["strSource"])
#     ingredient_measurement_hash.each do |ing, mes| 
#         @ingredient = Ingredient.find_or_create_by(name: ing.titlecase)
#         Measurement.create(ingredient: @ingredient, amount: mes)
#         ri = RecipeIngredient.create(ingredient: @ingredient, recipe: @recipe)
#     end
# end
