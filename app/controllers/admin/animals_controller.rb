class Admin::AnimalsController < Admin::BaseController
  before_action :current_admin?

  def new

    @animal = Animal.new
    render :new
  end

  def create
    byebug
    @animal = Animal.new()

  end

end
