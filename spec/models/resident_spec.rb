require 'rails_helper'

RSpec.describe Resident, type: :model do
  it "ResidentからFoodTypeが参照できる" do
    ft = FoodType.create(name: "てすとFT")
    r = Resident.new(name: "てすとさん", food_type_id: ft.id)
    expect(r.food_type.name).to eq "てすとFT"
  end

  it "先にFoodTypeが存在しないと作成できない" do
    resident = Resident.new(name: "てすとさん")
    expect(resident).not_to be_valid
  end

  it "現在入居している人たちを取得できる" do
    ft = FoodType.create(name: "てすとFT")

    r1 = Resident.dummy
    r1.move_in_date = (Time.now - 1).strftime('%Y-%m-%d %H:%M:%S')
    r1.save!

    r2 = Resident.dummy
    r2.move_in_date = (Time.now + 1).strftime('%Y-%m-%d %H:%M:%S')
    r2.save!

    r3 = Resident.dummy
    r3.move_out_date = (Time.now + 1).strftime('%Y-%m-%d %H:%M:%S')
    r3.save!
  
    r4 = Resident.dummy
    r4.move_in_date = (Time.now - 2).strftime('%Y-%m-%d %H:%M:%S')
    r4.save!

    r5 = Resident.dummy
    r5.move_in_date = (Time.now - 3).strftime('%Y-%m-%d %H:%M:%S')
    r5.save!

    expect(Resident.active_all.count).to eq 3
  end
end
