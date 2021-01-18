class AddFavoriteToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :favorite, :boolean
  end
end
