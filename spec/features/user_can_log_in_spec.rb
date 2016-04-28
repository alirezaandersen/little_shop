require 'rails_helper'

RSpec.feature "user logs in" do

  context "user can log in" do
    scenario "logged in user sees root page" do
      user = FactoryGirl.create(:user, password:"password")

      visit root_path

      click_on "Log In/Create Account"
      expect(page).to have_content("Log in")
      expect(page).to have_link("Create an Account")

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"

      assert dashboard_path, current_path
    end
  end
end
