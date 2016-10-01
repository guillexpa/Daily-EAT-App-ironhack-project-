class MenusController < ApplicationController
  before_action :find_menu, only: [:show, :destroy]
  def index
    @menus = Menu.all
  end

  def show
    @meals = @menu.meals
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @new_menu, status: :created }
      end
    end
  end

  def edit
  end

  def destroy
    @menu.destroy
    redirect_to root_path
  end

  private

  def find_menu
    @menu = Menu.find_by(id: params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :season)
  end

end
