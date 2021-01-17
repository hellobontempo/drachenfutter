 # /\d+/- collects any digits 1-99

recipe.nice_filter(['strMeal', 'strInstructions', 'strSource'])

instructions.gsub(/\r\n?/, " ") # remove from instructions
