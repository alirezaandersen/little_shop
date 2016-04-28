require "rails_helper"

RSpec.describe Favorite, type: :model do
  context "adds animals to favorites" do
    it "adds animal to contents" do
      cart = Favorite.new(nil)
      animal = FactoryGirl.create(:animal)

      cart.add_animal(animal.id)
      expect(cart.contents).to eq("1" => 1)
    end
  end

  it "returns a total number of animals in favorites" do
    @favorite = Favorite.new(nil)
    @favorite.add_animal(FactoryGirl.create(:animal).id)
    @favorite.add_animal(FactoryGirl.create(:animal).id)
    @favorite.add_animal(FactoryGirl.create(:animal).id)
    @favorite.add_animal(FactoryGirl.create(:animal).id)

    expect(@favorite.total).to eq(4)
  end

  it "removes an animal" do
    @favorite = Favorite.new(nil)
    animal1 = FactoryGirl.create(:animal)
    @favorite.add_animal(animal1.id)
    @favorite.add_animal(FactoryGirl.create(:animal).id)
    @favorite.add_animal(FactoryGirl.create(:animal).id)

    expect(@favorite.total).to eq(3)
    @favorite.remove_item(animal1.id, Visitation.new(nil))
    expect(@favorite.total).to eq(2)
  end

  it "has animals" do
    @favorite = Favorite.new(nil)
    animal1 = FactoryGirl.create(:animal)
    animal2 = FactoryGirl.create(:animal)
    animal3 = FactoryGirl.create(:animal)
    @favorite.add_animal(animal1.id)
    @favorite.add_animal(animal2.id)
    @favorite.add_animal(animal3.id)

    expect(@favorite.animals).to eq([animal1, animal2, animal3])
  end
end
