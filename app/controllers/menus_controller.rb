class MenusController < ApplicationController
  before_action :find_menu, only: [:show, :destroy]
  def index
    @menus = Menu.all
  end

  def show
    @menus = Menu.all
    @meals = @menu.meals
  end

  def new
    @menu = Menu.new
    # @seasons = ['Autumn'], ['Summer'], ['Winter'], ['Spring']
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      respond_to do |format|
        format.html
        format.json { render json: @new_menu, status: :created }
      end
      redirect_to select_meals_menu_path(@menu)
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
    # @meal_ingredient_list.each do |ingredient|
    #   @calories =+ ingredient.calories
    # end
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
    params.require(:menu).permit(:name, :season)
  end

end
