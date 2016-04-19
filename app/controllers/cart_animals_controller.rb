class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    @cart.add_animal(animal.id)

    session[:cart] = @cart.contents
    flash[:notice] = "You're about to adopt #{ animal.name}"

    redirect_to root_path
  end
end
