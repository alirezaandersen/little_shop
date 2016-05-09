# require "rails_helper"
#
# RSpec.feature "viewing visits" do
#   scenario "user'scheduled and past visits are available to see" do
#     user = FactoryGirl.create(:user, password: "password")
#     user.visits.create(date: "April 30, 2016", time: "1:00", user_id: user.id)
#     user.visits.create(date: "May 10, 2016", time: "3:00", user_id: user.id)
#
#     user2 = FactoryGirl.create(:user, password: "password")
#     user2.visits.create(date: "June 30, 2016", time: "1:00", user_id: user2.id)
#     user2.visits.create(
#       date: "December 10, 2016",
#       time: "3:00", user_id: user2.id
#     )
#
#     visit login_path
#     click_on "Log In"
#     fill_in "Email", with: user.email
#     fill_in "Password", with: "password"
#     click_on "Log in"
#
#     visit visits_path
#
#     expect(page).to have_content("Apr 30, 2016")
#     expect(page).to have_content("May 10, 2016")
#
#     expect(page).to_not have_content("Jun 30, 2016")
#     expect(page).to_not have_content("Dec 10, 2016")
#   end
# end
