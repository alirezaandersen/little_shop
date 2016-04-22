class FavoriteAnimalsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    animal = Animal.find(params[:animal_id])
    message = @favorite.add_animal(animal.id)
    session[:favorite] = @favorite.contents
    flash[:notice] = message
    redirect_to :back
  end

  def show

  end

  def index
    @animals = Animal.find(@favorite.contents.keys)
  end

  def destroy
    animal = Animal.find(params[:id])
    @favorite.remove_item(animal.id, @visit)
    flash[:notice] = "<a href='/animals/" + animal.id.to_s + "'>" + animal.name + "</a>"
    redirect_to :back
  end
end
