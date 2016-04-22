class SpeciesController < ApplicationController

  def show
    @species = Species.find_by(name: params[:type])
    @animals = @species.animals.where(available: true)
  end


end
