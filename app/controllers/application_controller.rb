class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_restaurant


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(user_id: current_user.id)
  end

  def authorize_user
    unless current_user
      flash[:message] = 'Please log in or register to access this page'
      redirect_to root_path
    end
  end
end
