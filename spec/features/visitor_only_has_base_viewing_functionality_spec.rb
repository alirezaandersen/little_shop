require 'rails_helper'

RSpec.feature "Unauthenticated user cannot view other user's info" do
  scenario "they cannot view dashboards, visits, admin screens or checkout" do
    visit '/dashboard'

    expect(current_path).to eq root_path

    visit visits_path

    expect(page).to have_content "The page you were looking for doesn't exist."

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
