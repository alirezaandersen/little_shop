require 'rails_helper'

RSpec.feature "user can see page with all dogs" do
  scenario "user can see all dogs" do
animal_canine = FactoryGirl.create(:species, name:"Dog")

    visit root_dogs_path

    expect(page).to have_content("Dogs")
    expect(page).to have_content("Ziba")
  end
end
