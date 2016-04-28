require 'rails_helper'

RSpec.feature "Visitor must login before checking out" do
  scenario "It prompts visitor to login instead of checking out" do
    user = FactoryGirl.create(:user, email: "email@email.com",
                                     password: "password")

    animal = FactoryGirl.create(:animal)

    visit animal_path(animal)
    click_on "Favorite"
    visit favorites_path

    expect(page).to have_content(animal.name)
    expect(page).to have_content("Log In or Create Account to schedule visit.")

    click_on "Log In"
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    click_on "Log in"

    expect(page).to have_content(animal.name)

    click_on "Add to Visit"
    click_on "Schedule Visit"
    fill_in "select a date", with: "30 April, 2016"
    click_on "Create Visit"

    expect(current_path).to eq visits_path
    expect(page).to have_content(animal.name)
    expect(page).to have_content("Apr 30, 2016")
  end
end
