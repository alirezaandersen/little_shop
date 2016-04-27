class Admin::AnimalsController < Admin::BaseController
  before_action :current_admin?

  def new

    @animal = Animal.new
    render :new
  end

  def create
    @animal = Animal.new(animal_params)
  #@animal = Animal.new(convert_values_to_integer(animal_params,[:sex,:size,:age,:activity_level]))
  # byebug
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
                            :image_path)
  end

  # def convert_values_to_integer(hash,keys_array)
  #   res = hash.map{ |k,v| keys_array.include?(k.to_sym) ? [k,v.to_i] : [k,v] }.to_h
  #   byebug
  # end

end
