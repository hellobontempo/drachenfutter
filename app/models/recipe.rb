class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :measurements
    has_many :ingredients, through: :measurements
    
end
