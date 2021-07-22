class Resident < ApplicationRecord
    validates :exist_food_type?, presence: true

    belongs_to :food_type

    def self.dummy
        dummy = Resident.new
        dummy.birthday = Faker::Date.birthday(min_age: 60, max_age: 100).strftime('%Y-%m-%d')
        dummy.gender = rand(1) == 1
        dummy.move_in_date = Date.today.strftime('%Y-%m-%d')
        dummy.move_out_date = nil
        
        name = Gimei.name
        dummy.name = name.kanji
        dummy.kana = name.katakana
        dummy.address = Gimei.address.kanji

        dummy.food_type_id = 1

        dummy.save
        dummy
    end

    def exist_food_type?
        self.food_type != nil
    end
end
