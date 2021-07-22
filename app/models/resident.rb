class Resident < ApplicationRecord
    def dummy!
        self.birthday = Faker::Date.birthday(min_age: 60, max_age: 100).strftime('%Y-%m-%d')
        self.gender = rand(1) == 1
        self.food_type = 0
        self.move_in_date = Date.today.strftime('%Y-%m-%d')
        self.move_out_date = nil
        
        name = Gimei.name
        self.name = name.kanji
        self.kana = name.katakana
        self.address = Gimei.address.kanji

        self.save!
    end
end
