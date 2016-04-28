require 'rails_helper'

RSpec.describe VisitHandler, type: :model do
  def creation
    animal = FactoryGirl.create(:animal)
    user = FactoryGirl.create(:user)
    visitation = Visitation.new(nil)
    visitation.add_animal(animal.id)
    visit = VisitHandler.create_visit(user, {"date" => "30 April, 2020"}, visitation.contents)
    [animal, user, visitation, visit]
  end

  it "creates a visit" do
    info = creation

    expect(Visit.last.animals).to eq([info[0]])
    expect(Visit.last.date.to_s).to eq("2020-04-30")
  end

  it "creates animal visits" do
    animal = FactoryGirl.create(:animal)
    visitation = Visitation.new(nil)
    visitation.add_animal(animal.id)

    VisitHandler.create_animal_visits(Visit.new, visitation.contents)

    expect(AnimalVisit.last.animal).to eq(animal)
  end

  it "verifies a visit" do
    info = creation

    expect(VisitHandler.verify(info[3], info[2])).to eq([true, "Visit was successfully scheduled"])
  end

end
