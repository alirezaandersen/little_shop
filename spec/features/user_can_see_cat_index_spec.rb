require 'rails_helper'

RSpec.feature "user can see page with all cats" do
  scenario "user can see all cats" do
    animal_feline = FactoryGirl.create(:species, name:"cats")
    animal = FactoryGirl.create(:animal, species: animal_feline)

    visit '/cats'
    expect(page).to have_content("Cats")
    expect(page).to have_content(animal.name)
  end
end
