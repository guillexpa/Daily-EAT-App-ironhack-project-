class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants.to_json, status: :ok
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])
    # respond_to do |format|
    #   format.json { render json: restaurant.to_json(include: :menus), status: :ok }
    #   format.html { render partial: 'home/restaurant',layout: false, :locals => { :restaurant => restaurant } }
    # end
    render json: restaurant.to_json(include: :menus), status: :ok 
  end

  def show_user_restaurant
    @restaurant = Restaurant.find_by(id: current_user.id)
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
      user_id: session[:user_id]
    )
    if @restaurant.save
      redirect_to root_path
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

  private
  #
  # def restaurant_params
  #   params.require(:restaurant).permit(:name, :email, :phone, :address, :city, :country, :description)
  # end


end
