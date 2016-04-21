require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "validations" do
      it { is_expected.to validate_presence_of(:animal_id) }
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
