require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:password_digest) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to have_many(:visits) }
      it { is_expected.to have_many(:animal_visits) }
    end
  end
