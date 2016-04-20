class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end
  
  def home
    @dogs = Animal.all.where(species: "dog").take(4)
    @cats = Animal.all.where(species: "cat").take(4)
  end

end
