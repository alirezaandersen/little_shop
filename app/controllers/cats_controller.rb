class CatsController < ApplicationController

  def index
    @cats = Animal.where(species: "cat")
  end

  def show

  end



end
