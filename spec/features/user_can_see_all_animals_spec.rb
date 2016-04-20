require 'rails_helper'

RSpec.feature "User can see all animals in index" do
  scenario "User sees a list of animals" do
    animal_1 = FactoryGirl.create(:animal)

    animal_2 = FactoryGirl.create(:animal)

    visit animals_path

    expect(page).to have_content("All Pets")
    expect(page).to have_content("#{animal_1.name}")
    expect(page).to have_content("#{animal_2.name}")

  end
end
