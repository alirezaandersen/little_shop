require 'rails_helper'

RSpec.feature "user can see page with all dogs" do
  scenario "user can see all dogs" do
    animal_canine = FactoryGirl.create(:species, name:"dogs")
    animal = FactoryGirl.create(:animal, species: animal_canine)


    visit "/dogs"
    expect(page).to have_content("Dogs")
    expect(page).to have_content(animal.name)
  end
end
