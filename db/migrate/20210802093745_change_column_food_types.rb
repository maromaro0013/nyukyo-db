class ChangeColumnFoodTypes < ActiveRecord::Migration[6.0]
  def change
      change_column :food_types, :color, :string, limit: 8
  end
end
