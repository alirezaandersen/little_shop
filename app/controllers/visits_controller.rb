class VisitsController < ApplicationController

  def new
    @visitation
    @visit = Visit.new
    @animals = Animal.find(@visitation.contents.keys.map(&:to_i))
  end

  def create
    binding.pry
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
