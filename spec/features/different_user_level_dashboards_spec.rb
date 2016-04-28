require "rails_helper"

RSpec.feature "Admin dashboard, user dashboard, visitor redirect" do
  scenario "visitor is redirected to home page" do
    visit dashboard_path

    expect(page).to have_content("All Pets")
    expect(current_path).to eq root_path
  end

  scenario "user sees their dashboard" do
    user = FactoryGirl.create(:user, password: "password")

    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Log in"

    visit dashboard_path

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
  end

  scenario "admin sees admin dashboard" do
    admin = FactoryGirl.create(:user, password: "password", role: 1)

    visit login_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_on "Log in"

    visit dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end
end
