class AddDefaultValueToFavoriteColumnReview < ActiveRecord::Migration[6.1]
  def change
      change_column_default :reviews, :favorite, false
  end
end
