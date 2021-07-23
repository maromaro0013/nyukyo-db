class ResidentsController < ApplicationController
    def index
        @residents = Resident.active_all
    end

    def show
    end
end
