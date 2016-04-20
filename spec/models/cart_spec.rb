require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "adds animal to contents" do
    cart = Cart.new({"animals" => {}, "accessories" => {}})
    animals = FactoryGirl.create(:animal)

    cart.add_animal(animals)
    expect(cart.contents).to eq({"animals" => {"1" => 1})
  end

end
