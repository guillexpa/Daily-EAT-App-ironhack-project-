class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants.to_json, status: :ok
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])
    render json: restaurant.to_json(:include => { :menus => {include: :meals}}), status: :ok
  end

  def show_user_restaurant
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    render 'show_user_restaurant'
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      address: params[:restaurant][:address],
      city: params[:restaurant][:city],
      country: params[:restaurant][:country],
      phone: params[:restaurant][:phone],
      email: params[:restaurant][:email],
      description: params[:restaurant][:description],
      rest_type: params[:restaurant][:rest_type],
      user_id: current_user.id
    )

    if @restaurant.save
      redirect_to restaurant_user_path
    else
      flash[:error] = "Someting went wrong"
      redirect_to 'restaurant/new'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(user_id: current_user.id)
    if @restaurant.destroy
      redirect_to root_path
    end
  end
end
