class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
  end

  def show
    if current_user
      render :show
    else
      render "Some error message, unauthorized", status: 403
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to '/signup'
    end
  end

  private

  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
