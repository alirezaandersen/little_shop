require 'rails_helper'

RSpec.feature "user can see page with all dogs" do
  scenario "user can see all dogs" do
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

    visit dogs_path

    expect(page).to have_content("Dogs")
    expect(page).to have_content("Ziba")
  end
end
