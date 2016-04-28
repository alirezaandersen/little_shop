require "rails_helper"

RSpec.describe Visit, type: :model do
  def creation
    animal = FactoryGirl.create(:animal)
    user = FactoryGirl.create(:user)
    visitation = Visitation.new(nil)
    visitation.add_animal(animal.id)
    visit = VisitHandler.create_visit(
      user,
      { "date" => "30 April, 2020" },
      visitation.contents
    )
    [animal, user, visitation, visit]
  end

  context "validations" do
    it { should have_many(:animals) }
    it { should have_many(:animal_visits) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:date) }
    it { should belong_to(:user) }
  end

  it "has a duration" do
    info = creation

    expect(info[3].duration).to eq(15)
  end

  it "is cancelled or completed" do
    info = creation

    info[3].update(status: 3)
    expect(info[3].completed?).to eq(true)

    info[3].update(status: 1)
    expect(info[3].cancelled?).to eq(true)
  end
end
