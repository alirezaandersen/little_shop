# require "rails_helper"
#
# RSpec.feature "User can checkout" do
#   scenario "user is taken to a list of their orders with the most recent order" do
#     animal = FactoryGirl.create(:animal)
#     user = FactoryGirl.create(:user, password: "password")
#
#     visit animal_path(animal)
#     click_on "Favorite"
#     visit favorites_path
#
#     click_on "Log In"
#     fill_in "Email", with: user.email
#     fill_in "Password", with: "password"
#     click_on "Log in"
#     expect(current_path).to eq favorites_path
#
#     click_on "Add to Visit"
#     click_on "Schedule Visit"
#     fill_in "select a date", with: "30 April, 2016"
#     click_on "Create Visit"
#
#     expect(current_path).to eq visits_path
#     expect(page).to have_content(animal.name)
#     expect(page).to have_content("Apr 30, 2016")
#   end
# end
