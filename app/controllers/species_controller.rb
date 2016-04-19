class SpeciesController < ApplicationController

  def index
    binding.pry
    @species = Species.find_by(name: params[:type])
    @animals = @species.animals
    render :species_index
  end


end
