class ApplicationController < ActionController::Base
    include ApplicationHelper
    include MeasurementsHelper
    include RecipesHelper


    def redirect_if_not_logged_in
        redirect_to '/' unless logged_in?
    end

end
