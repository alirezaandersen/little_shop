require "rails_helper"

RSpec.describe Visitation, type: :model do
  it "adds animal to contents" do
    cart = Visitation.new(nil)
    animal = FactoryGirl.create(:animal)

    cart.add_animal(animal.id)
    expect(cart.contents).to eq("1" => 15)
  end

  it "returns a total duration of visit" do
    @visitation = Visitation.new(nil)
    @visitation.add_animal(FactoryGirl.create(:animal).id)
    @visitation.add_animal(FactoryGirl.create(:animal).id)
    @visitation.add_animal(FactoryGirl.create(:animal).id)

    expect(@visitation.total_duration).to eq(45)
  end

  it "increases visit duration per animal" do
    @visitation = Visitation.new(nil)
    animal1 = FactoryGirl.create(:animal)
    @visitation.add_animal(animal1.id)

    expect(@visitation.total_duration).to eq(15)
    @visitation.increase_duration(animal1.id)
    expect(@visitation.total_duration).to eq(30)
  end

  it "has animals" do
    @visitation = Visitation.new(nil)
    animal1 = FactoryGirl.create(:animal)
    animal2 = FactoryGirl.create(:animal)
    animal3 = FactoryGirl.create(:animal)
    @visitation.add_animal(animal1.id)
    @visitation.add_animal(animal2.id)
    @visitation.add_animal(animal3.id)

    expect(@visitation.animals).to eq([animal1, animal2, animal3])
  end

  it "can decrease duration for animal" do
    @visitation = Visitation.new(nil)
    animal1 = FactoryGirl.create(:animal)
    @visitation.add_animal(animal1.id)

    @visitation.increase_duration(animal1.id)
    expect(@visitation.total_duration).to eq(30)
    @visitation.decrease_duration(animal1.id)
    expect(@visitation.total_duration).to eq(15)
  end

  it "knows the total number of animals in visit" do
    @visitation = Visitation.new(nil)
    animal1 = FactoryGirl.create(:animal)
    animal2 = FactoryGirl.create(:animal)
    animal3 = FactoryGirl.create(:animal)
    @visitation.add_animal(animal1.id)
    @visitation.add_animal(animal2.id)
    @visitation.add_animal(animal3.id)

    expect(@visitation.total_animals).to eq(3)
  end

  it "can remove animal" do
    @visitation = Visitation.new(nil)
    animal1 = FactoryGirl.create(:animal)
    animal2 = FactoryGirl.create(:animal)
    animal3 = FactoryGirl.create(:animal)
    @visitation.add_animal(animal1.id)
    @visitation.add_animal(animal2.id)
    @visitation.add_animal(animal3.id)

    expect(@visitation.animals).to eq([animal1, animal2, animal3])
    @visitation.remove_item(animal2.id)
    expect(@visitation.animals).to eq([animal1, animal3])
  end
end
