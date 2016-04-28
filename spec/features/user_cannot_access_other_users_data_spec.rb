require "rails_helper"

RSpec.feature "user cannot access other users data" do
  scenario "user sees either their own info, a 404, or gets redirected" do
    user = FactoryGirl.create(:user, email: "email@email.com",
                                     password: "password")
    visit login_path
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    click_on "Log in"

    visit visits_path

    expect(page).to have_content "You have not scheduled any visits"

    visit dashboard_path

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
