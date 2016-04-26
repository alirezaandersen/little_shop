class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @animals = @visitation.animals
  end

  def create
    @visit = VisitHandler.create_visit(current_user, visit_params, @visitation.contents)
    is_valid, message = VisitHandler.verify(@visit, @visitation)
    if is_valid
      UserMailer.scheduled_visit_email(@visit.user).deliver_now
      Text.scheduled_visit_text(current_user, @visit)
      flash[:notice] = message
      redirect_to visits_path
    else
      flash[:error] = message
      redirect_to new_visit_path
    end
  end

  def index
    @visits = current_user.visits
    @message = get_visits_message(@visits)
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

  def get_visits_message(visits)
    if visits.count == 0
      "You have not scheduled any visits"
    else
      "Your scheduled visits:"
    end
  end
end
