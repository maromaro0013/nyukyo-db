class FoodTypesController < ApplicationController
  def index
    @food_types = FoodType.all
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(food_type_params)
    if @food_type.save
      redirect_to action: :index
    else
      render "new"
    end
  end

  def edit
  end

  private
  def food_type_params
    params.require(:food_type).permit(:name, :color)
  end
end
