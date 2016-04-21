# require 'rails_helper'
#
# RSpec.feature "user log out" do
#
#   context "user can log out of session if logged in" do
#     scenario "logged in user sees root page" do
#       user = FactoryGirl.create(:user)
#
#      visit root_path
#      click_on "Log In/Create Account"
#      fill_in "Email", with: user.email
#      fill_in "Password", with: user.password
#      click_on "Log in"
#
#      expect(page).to have_content("Welcome, #{user.name}.")
#
#      click_on "Logout"
#      expect(page).to have_content("Logout")
#     end
#   end
# end
