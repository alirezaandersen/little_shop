class AccessoriesController < ApplicationController

  def index
    @accessories = Accessory.all
  end

  def show

  end

end
