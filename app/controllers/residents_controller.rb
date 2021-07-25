class ResidentsController < ApplicationController
    def index
        @residents = Resident.active_all
    end

    def new
        @food_types = FoodType.all
    end

    def show
    end
end
