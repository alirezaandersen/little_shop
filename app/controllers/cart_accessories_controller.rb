class CartAccessoriesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(accessory.id)

    session[:cart] = @cart.contents
    flash[:notice] = "#{accessory.name} has been added to your cart"

    redirect_to accessories_path
  end
end
