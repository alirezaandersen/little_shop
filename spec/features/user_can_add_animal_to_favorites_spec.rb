require 'rails_helper'

RSpec.feature "User can add animal to cart" do
  scenario "user sees add message and cart content" do
    animal = FactoryGirl.create(:animal)

    visit animals_path
    within(find_by_id(animal.id)) do
      find(".green").click
    end

    visit favorites_path
    expect(page).to have_content("#{animal.name}")
  end
end
