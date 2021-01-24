class WelcomeController < ApplicationController

    def home
       @recipes = Recipe.random_recipes
    end

end
