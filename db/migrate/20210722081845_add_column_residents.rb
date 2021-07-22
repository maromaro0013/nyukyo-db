class AddColumnResidents < ActiveRecord::Migration[6.0]
  def change
    add_reference :residents, :food_type, foreign_key: true, null: false
  end
end
