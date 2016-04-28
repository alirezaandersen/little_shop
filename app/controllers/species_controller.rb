class SpeciesController < ApplicationController

  def show
    @species = Species.find_by(name: params[:type])
    @animals = @species.animals.available
  end
end
