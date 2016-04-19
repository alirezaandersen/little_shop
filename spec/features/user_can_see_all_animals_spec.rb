require 'rails_helper'

RSpec.feature "User can see all animals in index" do
  scenario "User sees a list of animals" do
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

    Animal.create(species:"dog",
                  name:"Ziba",
                  breed: "lab",
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

    expect(page).to have_content("All Pets")
    expect(page).to have_content("Paul")
    expect(page).to have_content("Ziba")

  end
end
