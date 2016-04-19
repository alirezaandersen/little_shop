require 'rails_helper'

RSpec.feature "User can add animal to cart" do
  scenario "user sees add message and cart content" do
    Animal.create(species:"cat",
                  name:"Paul",
                  breed: "siamese",
                  sex:"female",
                  activity_level: 0,
                  house_trained: true,
                  spayed_neutered: true,
                  available: true,
                  size: 3,
                  special_needs: false,
                  age: 1,
                  image_path: "http://media4.giphy.com/media/5lAtcHWPAYFdS/giphy.gif"
                  )

    visit animals_path

    click_button "Adopt!"

    expect(page).to have_content("You're about to adopt Paul")
  end
end
