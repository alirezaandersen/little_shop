class VisitsController < ApplicationController

  def new
    @visit = Visit.new
    @animals = @visitation.animals
  end

  def create
    @visit = VisitHandler.create_visit(current_user, visit_params, @visitation.contents)
    is_valid, message = VisitHandler.verify(@visit, @visitation)
    if is_valid
      flash[:notice] = message
      redirect_to visits_path
    else
      flash[:error] = message
      redirect_to new_visit_path
    end
  end

  def index
    @visits = current_user.visits
    @message = Visit.get_message(@visits)
  end

  def show
    begin
      @visit = current_user.visits.find(params[:id])
    rescue
      render file: "/public/404"
    end
  end

private

  def visit_params
    params.require(:visit).permit(:date, :time)
  end
end
