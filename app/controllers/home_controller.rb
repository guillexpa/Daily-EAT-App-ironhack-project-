class HomeController < ApplicationController

  def index
    if current_user
      render 'index'
    else
      render 'map'
    end
  end
end
