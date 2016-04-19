require 'rails_helper'

RSpec.feature "user can see page with all cats" do
  scenario "user can see all cats" do
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

    visit cats_path

    expect(page).to have_content("Cats")
    expect(page).to have_content("Paul")
  end
end
