class DogsController < ApplicationController

  def index
    @dogs = Animal.where(species: "dog")
  end

  def show

  end



end
