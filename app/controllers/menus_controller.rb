class MenusController < ApplicationController
  before_action :find_menu, only: [:show, :destroy]
  def index

    @menus = current_restaurant.menus
  end

  def show
    @menus = current_restaurant.menus
    @meals = @menu.meals
  end

  def new
    @menu = Menu.new
  end

  def create
    @restaurant = current_restaurant
    @menu = Menu.new(
      name: params[:menu][:name],
      season: params[:menu][:season],
      price: params[:menu][:price],
      restaurant_id: current_restaurant.id
      )
    if @menu.save
      @restaurant.menus.push(@menu)
      redirect_to select_meals_menu_path(@menu)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end

  def edit
  end

  def select
    @menu = Menu.find_by(id: params[:menu_id])
    @meal_list = Meal.all
    @menu_list = @menu.meals
  end

  def add
    @menu = Menu.find_by(id: params[:menu_id])
    if @menu.meals.push(Meal.find_by(id: params[:id]))
      flash[:success] = "You have added a new meal to your menu"
      redirect_to :back
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_path
  end

  private

  def find_menu
    @menu = Menu.find_by(id: params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :season, :price)
  end

end
