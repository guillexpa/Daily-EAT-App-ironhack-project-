class IngredientsController < ApplicationController
  before_action :find_ingredient
  before_action :all_ingredients


  def index
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient added!"
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Information of #{@ingredient.name}has been changed!"
      redirect_to :back
    end
  end

  def destroy
    if @ingredient.destroy
      flash[:notice] = "#{@ingredient.name} ingredient has been deleted!!"
      redirect_to '/ingredients'
    end
  end

  private

  def all_ingredients
    @ingredient_list = Ingredient.all
  end

  def find_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :ing_type, :description, :gluten, :lactose)
  end
end
