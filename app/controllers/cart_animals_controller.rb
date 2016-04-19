class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    @cart.add_animal(animal.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You're about to adopt #{ animal.name}"
    redirect_to :back
  end

  def show

  end

  def index
    @animals = Animal.where(:id == @cart.contents.keys)
  end

  def destroy

  end


end
