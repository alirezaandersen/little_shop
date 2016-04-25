require "rails_helper"

RSpec.feature "User can checkout" do
  scenario "user is taken to a list of their orders with the most recent order" do
    animal = FactoryGirl.create(:animal)
    user = FactoryGirl.create(:user)

    visit animals_path
    within(find_by_id(animal.id)) do
      find(".green").click
    end

    visit favorites_path
    click_on "Create Account"
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Phone Number", with: user.phone_number
    fill_in "Email Address", with: user.email
    # within(find_by_id("new_user")) do
    #   fill_in "user_password", with: user.password_digest
    # end
    # within(find_by_id("new_user")) do
    #   click_on "Create Account"
    # end
    # within("main") do
    #   expect(page).to have_content("Favorites")
    # end
    #
    # find_by_id("visit#{animal.id}").click

    # click login or register
    # login
    # back to cart
    # click Schedule Visit
    # set date
    # schedule visit
    # current page is /visits
    # See visit in table
  end
end
