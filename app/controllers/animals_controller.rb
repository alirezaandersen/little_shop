class AnimalsController < ApplicationController

  def index
    @animals = Animal.where(available: true)
  end

  def home
    @dogs = Animal.where(species: "dogs").take(4)
    @cats = Animal.where(species: "cats").take(4)
  end

end
