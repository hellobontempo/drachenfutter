module UsersHelper


    def display_name
        current_user.name.titlecase
    end

    def display_favorite_recipes
        favorites = []
        user = User.find_by_id(params[:id])
        if user.reviews
            user.reviews.each do |r|
                favorites << r.recipe if r.favorite == true
            end
        end
        favorites
    end

end
