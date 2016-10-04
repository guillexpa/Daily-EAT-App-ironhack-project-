class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants.to_json({:include => :menus}), status: :ok
  end

  def show
    @restaurant = current_restaurant
  end

  def new
    @restaurant = Restaurant.new

    if current_user.restaurant
      flash[:error] = "You have a restaurant registered already"
      redirect_to root_path
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    if @restaurant.destroy
      redirect_to root_path
    end
  end


end
