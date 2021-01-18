class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    
    #Patient.includes(:physicians, :appointments).where('physicians.id = ? AND appointments.appointment_date = ?', <id or ids array>, Date.today)
 
  
    def self.search_by_ingredient(query)
        t = query.titlecase
        self.joins(:ingredients).where('ingredients.name = ?', "#{t}")
    end
end
