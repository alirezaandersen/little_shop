require 'rails_helper'

RSpec.feature "admin cannot modifyuser" do
  context "Admin cannot modify user" do
    scenario "Admin logs in and cannot see users dashboard to modify" do

      admin = FactoryGirl.create(:user, email: "i@admin.io", password:"admin", role: 1)

      # byebug
      visit root_path

      click_on "Log In/Create Account"
      expect(page).to have_content("Log in")
      expect(page).to have_link("Create an Account")

      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_on "Log in"

      assert admin_dashboard_path, current_path
    end
  end
end
