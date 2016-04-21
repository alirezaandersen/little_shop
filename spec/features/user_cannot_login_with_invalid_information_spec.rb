# require 'rails_helper'
#
# RSpec.feature "user cannot login with Invalid info" do
#
#   context "user cannot login" do
#     scenario "failed login attempted will receive error message" do
#       user = FactoryGirl.create(:user, password:"password")
#       update_user_password = user.update(password:"adlkhfsh")
#
#       visit root_path
#       click_on "Log In/Create Account"
#       fill_in "Email", with: user.email
#       fill_in "Password", with: update_user_password
#       click_on "Log in"
#
#       expect(page).to have_content("Invalid Email or Password")
#
#     end
#   end
# end
