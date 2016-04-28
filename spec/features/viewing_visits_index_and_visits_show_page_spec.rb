require "rails_helper"

RSpec.feature "Viewing visits index and visit showpage" do
  scenario "all necessary info is displayed on show page" do
    user = FactoryGirl.create(:user, password: 'password')
    user.visits.create(date: "May 10, 2016", time: "3:00", user_id: user.id)
    animal = FactoryGirl.create(:animal)

    visit login_path
    click_on "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Log in"

    visit animal_path(animal)
    click_link "Favorite"

    visit favorites_path
    click_link "Add to Visit"
    click_link "Schedule Visit"
    fill_in "select a date", with: "April 30, 2016"
    click_button "Create Visit"

    expect(page).to have_content("Apr 30, 2016")
    expect(page).to have_content("May 10, 2016")
    expect(page).to have_link("2016-04-30")
    expect(page).to have_link("2016-05-10")

    click_link "2016-04-30"

    expect(page).to have_content("Visitation Status: Scheduled")
    expect(page).to have_content("Scheduled for Saturday, Apr 30, 2016.")
    expect(page).to have_content(animal.name)
    expect(page).to have_content("Meeting duration: 15")
    expect(page).to have_content("Total duration of this visit: 15 minutes")
    expect(page).to have_content("Reservation made on")
  end
end
