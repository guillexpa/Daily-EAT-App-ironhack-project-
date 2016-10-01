class MenusGenerationController < ApplicationController

  def new
    @menu = Menu.new
  end

end
