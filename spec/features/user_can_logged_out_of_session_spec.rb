require "rails_helper"

RSpec.feature "user log out" do

  context "user can log out of session if logged in" do
    scenario "logged in user sees root page" do
      user = FactoryGirl.create(:user, password:"password")

      visit root_path
      click_on "Log In/Create Account"

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"

      assert dashboard_path, current_path

      click_on "Log Out"
      assert root_path, current_path
    end
  end
end
