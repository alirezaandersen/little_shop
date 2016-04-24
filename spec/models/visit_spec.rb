require 'rails_helper'

RSpec.describe Visit, type: :model do
  context "validations" do
    it {should have_many(:animals)}
    it {should belong_to(:user)}
    end
  end
