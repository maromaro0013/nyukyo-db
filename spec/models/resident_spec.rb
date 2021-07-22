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
end
