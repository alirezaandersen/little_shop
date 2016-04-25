class VisitsController < ApplicationController

  def new
    @visitation
    @visit = Visit.new
    @animals = Animal.find(@visitation.contents.keys.map(&:to_i))
  end

  def create
    @visit = current_user.visits.new(visit_params)
    animal_visits = @visit.create_animal_visits(@visit, @visitation.contents)
    if @visit.valid?
      @visitation.contents.clear
      flash[:notice] = "Visit was successfully scheduled"
      redirect_to visits_path
    else
      if @visit.date < Time.new
        flash[:error] = "Visit must be scheduled a day in advance"
      else
        flash[:error] = "Failed to schedule visit"
      end
      redirect_to new_visit_path
    end
  end

  def index
    @visits = current_user.visits
    @message = Visit.get_message(@visits)
  end

  def show
    @visit = Visit.find(params[:id])
  end

private

  def visit_params
    params.require(:visit).permit(:date, :time)
  end
end
