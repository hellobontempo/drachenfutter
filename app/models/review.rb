class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :content, presence: true, length: { maximum: 500 }
  validates :rating, presence: true
  scope :order_by_date, -> {order(created_at: :desc)} 
  scope :order_by_recipe, -> {order(recipe_id: :desc)} 
  scope :select_favorites, -> {where("favorite LIKE ?", true)}
  # scope :select_favorites, ->  {where("favorite @> ?", true)}



  def recipe_title
    self.recipe.title
  end
  
end
