require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:animal_id) }
    it { is_expected.to validate_presence_of(:user_id) }
      
    it "adds animal to contents" do
      cart = Favorite.new(nil)
      animal = FactoryGirl.create(:animal)

      cart.add_animal(animal.id)
      expect(cart.contents).to eq({"1" => 1})
    end
  end
end
