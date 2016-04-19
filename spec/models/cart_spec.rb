require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "adds animal to contents" do
    cart = Cart.new({"animals" => {}, "accessories" => {}})
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

    cart.add_animal(1)
    expect(cart.contents).to eq({"animals" => {"1" => 1}, "accessories" => {}})
  end

  it "adds accessory to contents" do
    cart = Cart.new({"animals" => {}, "accessories" => {}})
    Accessory.create(
          name: "Accessory"
    )

    cart.add_accessory(1)
    expect(cart.contents).to eq({"animals" => {}, "accessories" => {"1" => 1}})
  end

end
