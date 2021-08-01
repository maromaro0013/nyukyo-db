class ResidentsController < ApplicationController
  def index
    @residents = Resident.active_all
  end

  def new
    @food_types = FoodType.all.map { |ft| [ft.name, ft.id] }
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to action: :index
    end
  end

  def show
    @resident = Resident.find(params[:id])
  end

  private
  def resident_params
    params.require(:resident).permit(:name, :kana, :gender, :move_in_date, :food_type_id)
  end
end
