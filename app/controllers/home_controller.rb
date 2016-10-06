class HomeController < ApplicationController

  def views
    if current_user
      render 'index'
    else
      render 'map'
    end
  end
end
