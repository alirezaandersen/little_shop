class AnimalsController < ApplicationController

  def index
    @animals = Animal.where(available: true)
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def home
    @dogs = Animal.where(species: Species.where(name: "dogs")).take(4)
    @cats = Animal.where(species: Species.where(name: "cats")).take(4)
  end

end
