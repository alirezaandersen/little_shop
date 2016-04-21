class VisitAnimalsController < ApplicationController
  before_action :check_user
  before_action :set_animal, except: [:index]

  def create
    visit = Visit.new(animal: @animal, user: current_user)
    if total < 4
      if visit.save
        flash[:notice] = "Added to visit"
      else
        flash[:notice] = "Couldn't add #{@animal.name} to Visit"
      end
    else
      flash[:notice] = "Can't add more than 3 animals to a visit"
    end
    redirect_to '/favorites'
  end

  def index
    @animals = Animal.find(@visit.contents.keys)
  end

  def destroy
    Visit.where(animal_id: @animal.id, user_id: current_user.id).first.destroy
    flash.now[:notice] = "#{@animal.name} removed from visit."
    redirect_to '/favorites'
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
