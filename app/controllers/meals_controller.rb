class MealsController < ApplicationController
  before_action :find_meal, only: [:show, :destroy, :edit, :update]
  before_action :all_meals, only: [:index, :show]

  def index
  end

  def show
    @meal_ingredient_list = @meal.ingredients
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      flash[:success] = "Good! Now choose the ingredients you need for this meal"
      redirect_to meal_ingredients_path(@meal)
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      flash[:notice] = "#{@meal.name}has been changed!"
      redirect_to meal_ingredients_path(@meal)
    end
  end

  def destroy
    @menu = Menu.find_by(id: params[:menu_id])
    if !@menu
      if @meal.destroy
        flash[:notice] = "#{@meal.name} has been deleted!!"
        redirect_to '/meals'
      end
    else
      if @menu.meals.destroy(@meal)
        flash[:notice] = "#{@meal.name} has been deleted from #{@menu.name} menu!!"
        redirect_to '/meals'
      end
    end
  end



  private

  def all_meals
    @meal_list = Meal.all
  end

  def find_meal
    @meal = Meal.find_by(id: params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :calories, :description, :price)
  end
end
