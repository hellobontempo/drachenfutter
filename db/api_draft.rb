
require 'rest-client'
require 'nice_hash'

@@ingredients = []
@@measurements = []

response = RestClient.get "https://www.themealdb.com/api/json/v1/1/random.php"
recipe = JSON.parse(response)["meals"][0]


# make each ingredient an object
# in recipes, iterate through measurements and assign to ingredients 



 # /\d+/- collects any digits 1-99

recipe.nice_filter(['strMeal', 'strInstructions', 'strSource'])
strMeal(name)
strInstructions(directions)
strMealThumb(pic)
strIngredient1
strIngredient2  ...etc 
strMeasure1 
strMeasure2
strsource(link)

instructions.gsub(/\r\n?/, " ") # remove from instructions
