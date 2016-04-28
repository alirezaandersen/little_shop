require "rails_helper"

RSpec.feature "Guest/visitor can remove items from cart" do
  scenario "the contents of the cart should change" do
    animal = FactoryGirl.create(:animal)

    visit animal_path(animal)
    click_link "Favorite"

    visit favorites_path

    expect(page).to have_content(animal.name)

    click_link "Remove Favorite"

    expect(page).to_not have_content(animal.name)
  end
end
