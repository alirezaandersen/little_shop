class AccessoriesController < ApplicationController

  def index
    @accessories = Accessories.all
  end

  def show

  end

end
