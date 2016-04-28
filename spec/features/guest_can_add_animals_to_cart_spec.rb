require "rails_helper"

RSpec.feature "Guest can add animals to cart" do
  scenario "animals show up in favorites when they visit favorites path" do
    animal = FactoryGirl.create(:animal)

    visit animal_path(animal)
    click_link "Favorite"
    visit favorites_path

    expect(current_path).to eq favorites_path
    expect(page).to have_css("img[src*='#{animal.image_path}']")
    expect(page).to have_content(animal.name)
    expect(page).to have_content(animal.breed)
    expect(page).to have_content(animal.age)
  end
end
