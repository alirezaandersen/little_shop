require "rails_helper"

RSpec.feature "Admin can edit their account" do
  scenario "admin is taken back to dashboard after edit" do
    admin = FactoryGirl.create(:user, role: 1)
    user = FactoryGirl.create(:user)
    expect(admin.role).to eq("admin")



  end
end
