require 'rails_helper'

RSpec.feature "user logs in" do

  context "user can log in" do
    scenario "logged in user sees root page" do
      user = FactoryGirl.create(:user)

     visit root_path
     click_on "Log In/Create Account"
    
     fill_in "Email", with: user.email
     fill_in "Password", with: user.password
     click_on "Log in"

     expect(page).to have_content("Welcome, #{user.name}.")
     expect(page).to have_content("Logout")
    end
  end
end
