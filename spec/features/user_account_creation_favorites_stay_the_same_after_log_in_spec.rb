require "rails_helper"

RSpec.feature "Creating Account/Login does not remove favorites" do
  scenario "guest can add favorites, login, and favorites will persist" do
    animal = FactoryGirl.create(:animal)

    visit animal_path(animal)
    click_link "Favorite"

    expect(page).to have_content(animal.name)

    visit favorites_path

    click_link "Create Account"
    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Liss"
    fill_in "Email Address", with: "jon@example.com"
    fill_in "Password", with: "password"
    click_link "Create Account"

    fill_in "Email", with: "jon@example.com"
    fill_in "Password", with: "password"
    click_on "Log in"

    visit favorites_path

    expect(page).to have_content(animal.name)
  end
end
