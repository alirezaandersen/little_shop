require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it "adds animal to contents" do
    Species.find_or_create_by(name: "dogs")
    favorite = Favorite.new(nil)
    animal = FactoryGirl.create(:animal)

    favorite.add_animal(animal.id)
    expect(favorite.contents).to eq({"1" => 1})
  end

end
