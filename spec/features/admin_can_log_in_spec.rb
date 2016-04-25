require 'rails_helper'

RSpec.feature "admin can log in" do
  context "Admin can log in" do
    scenario "Admin logs in and is redirected to admin dashboard" do

      admin = FactoryGirl.create(:user, password:"password", role: 1)

      visit root_path

      click_on "Log In/Create Account"
      expect(page).to have_content("Log in")
      expect(page).to have_link("Create an Account")

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"

      assert admin_dashboard_path, current_path
    end
  end
end
