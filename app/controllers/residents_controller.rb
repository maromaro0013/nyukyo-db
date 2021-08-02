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
    else
      render 'new'
    end
  end

  def show
    @resident = Resident.find(params[:id])
  end

  def edit
    @food_types = FoodType.all.map { |ft| [ft.name, ft.id] }
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    if @resident.update_attributes(resident_params)
      redirect_to @resident
    else
      render 'edit'
    end
  end

  def destroy
    Resident.find(params[:id]).destroy
    redirect_to "/"
  end

  private
  def resident_params
    params.require(:resident).permit(:name, :kana, :gender, :birthday, :move_out_date, :move_in_date, :address, :food_type_id)
  end
end
