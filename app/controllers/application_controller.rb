class ApplicationController < ActionController::Base
    include ApplicationHelper
    include RecipesHelper
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def redirect_if_not_logged_in
        redirect_to '/', alert: "Please log in or create and account." unless logged_in?
    end

    def route_not_found
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
  
    def record_not_found
        render 'layouts/record_not_found'
    end

end
