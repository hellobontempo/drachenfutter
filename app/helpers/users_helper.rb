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
end
