require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "adds animal to contents" do
    cart = Cart.new(nil)
    animal = FactoryGirl.create(:animal)

    cart.add_animal(animal.id)
    expect(cart.contents).to eq({"1" => 1})
  end

end
