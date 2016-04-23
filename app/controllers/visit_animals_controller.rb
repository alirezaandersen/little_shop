class VisitAnimalsController < ApplicationController
  before_action :check_user
  before_action :set_animal, except: [:index]

  def index
    @animals = Animal.find(@visitation.contents.keys)
  end

  def create
    animal = Animal.find(params[:animal_id])
    message = @visitation.add_animal(animal.id)
    session[:visit] = @visitation.contents
    flash[:notice] = message
    redirect_to :back
  end

  def destroy
    animal = Animal.find(params[:id])
    @visitation.remove_item(animal.id)
    flash[:notice] = "<a href='/animals/#{animal.id}'>Removed #{animal.name} from visit</a>"
    redirect_to :back
  end

  def plus
    animal = Animal.find(params[:animal_id])
    @visitation.increase_duration(animal.id)
    redirect_to :back
  end

  def minus
    animal = Animal.find(params[:animal_id])
    @visitation.decrease_duration(animal.id)
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
