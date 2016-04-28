require "rails_helper"

RSpec.describe Animal, type: :model do
  context "validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:image_path) }
      it { is_expected.to validate_presence_of(:breed) }
      it { is_expected.to validate_presence_of(:sex) }
      it { is_expected.to validate_presence_of(:age) }
      it { is_expected.to validate_presence_of(:activity_level) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:species_id) }
    end
  it { should have_many(:animal_visits) }

  it "capitalizes name" do
    animal = FactoryGirl.create(:animal, name: "name")

    expect(animal.name).to eq("Name")
  end

  it "can return available animals" do
    animal = FactoryGirl.create(:animal)

    expect(Animal.available).to eq([animal])
  end
end
