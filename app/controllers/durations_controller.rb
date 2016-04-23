class DurationsController < ApplicationController

  def update
    animal = Animal.find(params[:id])
    @visitation.update_duration(params:[:duration], animal)
  end

end
