class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged successfully"
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password. Please, try again"
      redirect_to '/login'
    end
  end

  def destroy
    if session.clear
      redirect_to root_path
      flash[:error] = "Bye! Have a nice day!"
    end
  end
end
