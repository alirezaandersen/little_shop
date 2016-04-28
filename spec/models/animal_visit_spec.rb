require "rails_helper"

RSpec.describe AnimalVisit, type: :model do
  context "validations" do
    it { should belong_to(:animal) }
    it { should belong_to(:visit) }
  end
end
