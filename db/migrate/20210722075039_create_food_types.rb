class CreateFoodTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :food_types do |t|
      t.string :name, null: false, default: "", limit: 8
      t.string :color, null: false, default: "", limit: 6
    
      t.timestamps
    end
  end
end
