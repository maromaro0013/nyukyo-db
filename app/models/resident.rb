class Resident < ApplicationRecord
    validates :exist_food_type?, presence: true

    belongs_to :food_type

    def self.dummy
        dummy = Resident.new
        dummy.birthday = Faker::Date.birthday(min_age: 60, max_age: 100).strftime('%Y-%m-%d')
        dummy.move_in_date = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        dummy.move_out_date = nil
        
        name = Gimei.name
        dummy.name = name.kanji
        dummy.kana = name.katakana
        dummy.gender = name.male?
        dummy.address = Gimei.address.kanji

        dummy.food_type_id = FoodType.first.id

        dummy.save
        dummy
    end

    def exist_food_type?
        self.food_type != nil
    end

    # 入居中の人を取得する
    def self.active_all
        # 退去日が設定されてない && 入居が現在時刻よりも前である
        Resident.where("move_out_date IS NULL AND move_in_date < NOW()")
    end

    def get_gender_str
        self.gender ?  "男性" : "女性"
    end
end
