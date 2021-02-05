module RecipesHelper

  
    def link_to_image(image_path, target_link,options={})
        link_to(image_tag(image_path, :border => "0"), target_link, options)
    end

    def index_search_and_filter_results
        if params[:q]
            a = params[:q].split(",").map{|i| i.downcase}.to_sentence
            if @recipes.empty? 
                "There are no recipes containing #{a}"
            else 
                "#{@recipes.length} recipe(s) with #{a}"
            end
        elsif params[:category] 
            content_tag :h4, "#{params[:category]} Recipes", class:"center"
        elsif params[:commit]
            content_tag :h4, "Crowd Pleasers", class:"center"
        end 
    end

    def crowd_pleasers_button #filters favorite recipes
        form_tag(recipes_path, method: 'get') do 
            submit_tag "Crowd Pleasers", class: "btn btn-primary my-2 my-lg-0" 
        end 
    end

    def browse_by_ingredient_button
        link_to "Browse By Ingredient", ingredients_path, class: "btn btn-primary btn-lg"
    end

    def all_recipes_button
        link_to "All #{Recipe.count} Recipes", recipes_path, class: "btn btn-primary btn-lg"
    end

    
end



