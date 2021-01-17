module UsersHelper


    def display_name
        current_user.name.titlecase
    end

end
