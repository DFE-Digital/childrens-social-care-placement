require "rails_helper"

RSpec.describe PlacementNeed, type: :model do
  let(:placement_need) { build(:placement_need) }
  let(:emergency) { build(:placement_need, emergency: true) }

  it { is_expected.to belong_to(:child).required.inverse_of(:placement_need) }

  describe "options validation" do
    it "is invalid without any options" do
      expect(placement_need).to be_invalid
      expect(placement_need.errors[:base]).to include("Select an option from the list")
    end

    it "is valid with an option" do
      expect(emergency).to be_valid
    end
  end

  describe "#placement_date" do
    it { is_expected.to_not allow_value(nil).for :placement_date }
    it { is_expected.to_not allow_value(Time.zone.yesterday).for :placement_date }
  end

  describe "#postcode" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("eh3 9eh", "TR1 1XY", "hs13eq").for :postcode }
  end
end
