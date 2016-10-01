class RecipesController < ApplicationController
  before_action :find_meal
  before_action :find_ingredient

  def index
    @meal_ingredient_list = @meal.ingredients

    if params[:search]
      @ingredient_list = Ingredient.where(:name => params[:search]).to_a
      redirect_to :back
    else
      @ingredient_list = Ingredient.all
    end

    # @meal_ingredient_list.each do |ingredient|
    #   @calories =+ ingredient.calories
    # end
  end

  def add
    if @meal.ingredients.push(@ingredient)
      flash[:notice] = "#{@ingredient.name} has been added to the #{@meal.name} recipe"
      redirect_to :back
    end
  end

  def destroy
    if @meal.ingredients.destroy(@ingredient)
      flash[:notice] = "#{@ingredient.name} has been taken off from the #{@meal.name} recipe"
      redirect_to :back
    end
  end

  private

  def find_meal
    @meal = Meal.find_by(id: params[:meal_id])
  end

  def find_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end
end
