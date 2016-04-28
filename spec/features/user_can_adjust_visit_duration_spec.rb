require 'rails_helper'

RSpec.feature "User can adjust the duration of visit for animal" do
  scenario "User increases time spent with animal" do
    animal = FactoryGirl.create(:animal)
    user = FactoryGirl.create(:user,
                              email: "jon@example.com",
                              password: "password"
                              )

    visit animal_path(animal)
    click_link "Favorite"
    visit favorites_path
    click_link "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_link "Add to Visit"
    click_link "Schedule Visit"

    expect(page).to have_content("Visit Duration: 15 minutes")

    click_link "+"

    expect(page).to have_content("Visit Duration: 30 minutes")

    click_link "-"

    expect(page).to have_content("Visit Duration: 15 minutes")
  end
end
