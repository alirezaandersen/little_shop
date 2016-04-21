class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def home
    @dogs = Animal.where(species: Species.where(name: "dogs")).take(5)
    @cats = Animal.where(species: Species.where(name: "cats")).take(5)
  end

end
