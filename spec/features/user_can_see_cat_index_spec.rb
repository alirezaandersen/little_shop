require 'rails_helper'

RSpec.feature "user can see page with all cats" do
  scenario "user can see all cats" do
  animal_feline = FactoryGirl.create(:species, name:"cat")

   visit animals_cats_path
    expect(page).to have_content("Cats")
    expect(page).to have_content("animal_feline.name")
  end
end
