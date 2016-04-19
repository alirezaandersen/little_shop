require 'rails_helper'

RSpec.feature "User can see all accessories in index" do
  scenario "User sees a list of accessories" do
    Accessory.create(
        category: 1,
        species: "dog",
        description: "The most awesome accessory",
        name: "Awesome Accessory"
        )

    visit accessories_path

    expect(page).to have_content("Accessories")
    expect(page).to have_content("Awesome Accessory")
    
  end
end
