require "rails_helper"

RSpec.describe Child, type: :model do
  subject(:model) { build(:child) }

  it { is_expected.to have_many(:placements).inverse_of(:child) }
  it { is_expected.to have_many(:foster_parents).through(:placements) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe "#full_name" do
    subject(:model) { build(:child, first_name: "FN", middle_name: "MN", last_name: "LN") }

    it "returns all parts of the name separated by spaces" do
      expect(model.full_name).to eql("FN MN LN")
    end
  end
end
