class VisitAnimalsController < ApplicationController
  before_action :check_user
  before_action :set_animal, except: [:index]

  def index
    @animals = Animal.find(@visit.contents.keys)
  end

  def create
    animal = Animal.find(params[:animal_id])
    message = @visit.add_animal(animal.id)
    session[:visit] = @visit.contents
    flash[:notice] = message
    redirect_to :back
  end

  def destroy
    animal = Animal.find(params[:id])
    @visit.remove_item(animal.id)
    flash[:notice] = "<a href='/animals/" + animal.id.to_s + "'>" + animal.name + "</a>"
    redirect_to :back
  end

private

  def total
    current_user.visit_animals.count
  end

  def check_user
    render file: "/public/404" unless current_user
  end

  def set_animal
    @animal = Animal.find(params[:animal_id] || params[:id])
  end
end
