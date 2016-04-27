class Admin::AnimalsController < Admin::BaseController
  before_action :current_admin?

  def new
    @animal = Animal.new
    render :new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:success] = "#{@animal.name} has been successfully registered"
      redirect_to animal_path(@animal)
    else
      flash.now[:error] = "One or more valid fields are missing!"
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    if @animal.save
      flash[:success] = "Animal Successfully Updated"
      redirect_to animal_path(@animal)
    else
      flash.now[:error] = "One or more valid fields are missing!"
      render :edit
    end
  end

  private

  def animal_params
    params.require(:animal).permit(
      :species_id,
      :name,
      :breed,
      :sex,
      :size,
      :age,
      :activity_level,
      :house_trained,
      :spayed_neutered,
      :special_needs,
      :available,
      :description,
      :image_path
    )
  end
end
