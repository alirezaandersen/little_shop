class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def species_index
    binding.pry
    @species = params[:type]
    @animals = Animal.where(species: Species.find_by(name: params[:type]))
    render :species_index
  end

end
