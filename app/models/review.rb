class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :content, presence: true, length: { maximum: 500 }
  validates :rating, presence: true
  scope :order_by_date, -> {order(created_at: :desc)} 
end
