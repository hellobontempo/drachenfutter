class WelcomeController < ApplicationController

    def home
       @recipes = Recipe.random_recipes(4)
    end

end
