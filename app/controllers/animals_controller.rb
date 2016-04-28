class AnimalsController < ApplicationController
  def index
    @animals = Animal.available
  end


  def show
    @animal = Animal.find(params[:id])
  end
end
