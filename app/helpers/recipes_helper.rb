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
                "Recipes with #{a}"
            end
        elsif params[:category] 
            "#{params[:category]}"
        end 
    end
end



# <% if !@recipes.empty? %>
# <% @recipes.each do |r|%>
#     <%= render partial: 'recipe_grid', locals: {r: r} %>
# <% end %>
# <% else %>
# There are no recipes containing <%="#{params[:q]}"%>.<br>
# Search for another ingredient or create a <%= link_to "new recipe", new_recipe_path %>
# <% end %>