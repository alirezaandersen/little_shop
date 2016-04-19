class CartAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    message = @cart.add_animal(animal.id)
    session[:cart] = @cart.contents
    flash[:notice] = message
    redirect_to :back
  end

  def show

  end

  def index
    @animals = Animal.find(@cart.contents.keys)
  end

  def destroy
    animal = Animal.find(params[:id])
    @cart.remove_item(animal.id)
    redirect_to :back
  end


end
