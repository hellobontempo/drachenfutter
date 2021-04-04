module UsersHelper


    def display_name
        if same_user
            content_tag :h3, "Hiya, #{current_user.name.titlecase}"
        else
            content_tag :h3, "#{@user.name.titlecase}'s Recipes"
        end
    end

    def edit_username
        link_to "Edit Username '#{@user.username}'", edit_user_path(current_user) if same_user
    end

    def same_user
        current_user == @user
    end


    def display_favorite_recipes
        html = ""
        byebug
        favorites = @user.reviews.select_favorites
        if favorites != []
            favorites.each do |r|
                html += (render partial: 'recipes/recipe_grid', locals: {r: r.recipe})
            end 
            html.html_safe
        else
            content_tag :h5, "No favorite recipes to display"
        end
    end
    
    def created_recipes
        @user.created_recipes
    end
   
end
