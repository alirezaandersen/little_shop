class AnimalsController < ApplicationController

  def index
    @animals = Animal.where(available: true)
  end

  def show
    @animal = Animal.find(params[:id])
  end

end
