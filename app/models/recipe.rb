class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :creator, class_name: "User"
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    
    accepts_nested_attributes_for :recipe_ingredients, reject_if: proc { |attributes| attributes['amount'].blank? }
    
    validates_presence_of :title
    validates_presence_of :instructions

    def self.search_by_ingredient(query)
        s = query.split(", ").map {|e| e.strip.titlecase}
        if s.length == 1
            self.joins(:ingredients).where('name = ? OR name = ? OR name = ?', "#{s[0]}", "#{s[1]}", "#{s[2]}").group('recipes.id').having('COUNT(*) = 1')
        elsif s.length == 2
            self.joins(:ingredients).where('name = ? OR name = ? OR name = ?', "#{s[0]}", "#{s[1]}", "#{s[2]}").group('recipes.id').having('COUNT(*) = 2')
        else s.length == 3
            self.joins(:ingredients).where('name = ? OR name = ? OR name = ?', "#{s[0]}", "#{s[1]}", "#{s[2]}").group('recipes.id').having('COUNT(*) = 3')
        end
    end 



    def titlecase_title
        self.title = self.title.titlecase
    end


end
