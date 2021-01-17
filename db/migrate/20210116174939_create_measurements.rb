# class CreateMeasurements < ActiveRecord::Migration[6.1]
#   def change
#     create_table :measurements do |t|
#       t.string :amount
#       t.references :recipe, null: false, foreign_key: true
#       t.references :ingredient, null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end
