class CreateResidents < ActiveRecord::Migration[6.0]
  def change
    create_table :residents do |t|
      t.string :name, null: false, default: "", limit: 32
      t.string :kana, null: false, default: "", limit: 32
      t.datetime :birthday, null: false, default: -> { 'NOW()' }
      t.boolean :gender, null: false, default: true
      t.datetime :move_in_date, null: false, default: -> { 'NOW()' }
      t.datetime :move_out_date, null: true
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
