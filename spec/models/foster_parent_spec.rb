require "rails_helper"

RSpec.describe FosterParent, type: :model do
  it { is_expected.to belong_to(:user).required.inverse_of(:foster_parent) }
  it { is_expected.to have_many(:placements).inverse_of(:foster_parent) }
  it { is_expected.to have_many(:children).through(:placements) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe "#full_name" do
    subject(:model) { build(:child, first_name: "FN", middle_name: "MN", last_name: "LN") }

    it "returns all parts of the name separated by spaces" do
      expect(model.full_name).to eql("FN MN LN")
    end
  end
end
