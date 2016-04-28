require "rails_helper"

RSpec.feature "User can't add adopted animal to cart" do
  scenario "clicking on favorite button doesn't do anything" do
    animal = FactoryGirl.create(:animal, available: false)
    visit animal_path(animal)

    find(".disabled").click

    expect(current_path).to eq animal_path(animal)
  end
end
