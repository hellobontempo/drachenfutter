 # /\d+/- collects any digits 1-99

recipe.nice_filter(['strMeal', 'strInstructions', 'strSource'])

instructions.gsub(/\r\n?/, " ") # remove from instructions

measurements
=> ["500g", "1 tsp ", "7g", "300ml ", "40g", "1", "Dash", "25g", "75g", "2 tsp", "150g", "2 tbs", "2 tbs"] 
2.6.1 :065 > ingredients
=> ["White Flour", "Salt", "Yeast", "Milk", "Butter", "Eggs", "Vegetable Oil", "Butter", "Brown Sugar", "Cinnamon", "Dried Fruit", "Milk", "Caster Sugar"] 
2.6.1 :066 > 

pairs = ingredients.zip(measurements)
pairs.each_with_object(Hash.new { |h,k| h[k]=[] }) { |(f,l),h| h[f] << l }

pairs.each_with_object({}) { |(f,l),h| (h[f] ||= []) << l }