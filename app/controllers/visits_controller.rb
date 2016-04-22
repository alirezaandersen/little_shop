class VisitsController < ApplicationController

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
  end

  def index
    @visits = current_user.visits
  end



private

  def visit_params
    params.require(:visit).permit(:date, :time, :animals, :user)
  end
end
