class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create

    if params[:animal_id]
      animal = Animal.find(params[:animal_id])
      @cart.add_animal(animal.id)
      session[:cart] = @cart.contents
      flash[:notice] = "You're about to adopt #{ animal.name}"
    elsif params[:accessory_id]
      accessory = Accessory.find(params[:accessory_id])
      @cart.add_accessory(accessory.id)
      session[:cart] = @cart.contents
      flash[:notice] = "#{accessory.name} has been added to your cart"
    end

    redirect_to :back
  end

  def show

  end

  
end
