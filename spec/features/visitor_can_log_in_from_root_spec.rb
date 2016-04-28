require "rails_helper"

RSpec.feature "visitor visits root path and sees link to log in" do
  scenario "there is a way to login from route path" do
    visit root_path

    expect(page).to have_link("Log In")

    click_on "Log In"

    expect(current_path).to eq login_path
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_link("Create an Account")
  end
end
