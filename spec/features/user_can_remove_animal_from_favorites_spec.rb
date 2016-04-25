require 'rails_helper'

RSpec.feature "User can remove animal from favorites" do
  scenario "User can change mind" do
    animal = FactoryGirl.create(:animal)

    visit animals_path
    within(find_by_id(animal.id)) do
      find(".green").click
    end

    visit favorites_path
    expect(page).to have_content(animal.name)
    find_by_id("fav#{animal.id.to_s}").click
    expect(page).to_not have_content(animal.name)
  end
end
