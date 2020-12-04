require "rails_helper"

RSpec.describe PlacementNeed, type: :model do
  include_context "sanitize fields", %i[postcode]

  it { is_expected.to belong_to(:child).required.inverse_of(:placement_need) }

  it_behaves_like "boolean options list" do
    let(:model_class) { described_class }
  end

  describe "#placement_date" do
    it { is_expected.to_not allow_value(nil).for :placement_date }
    it { is_expected.to_not allow_value(Time.zone.yesterday).for :placement_date }
  end

  describe "#postcode" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("eh3 9eh", "TR1 1XY", "hs13eq").for :postcode }
  end

  describe "#placement_type" do
    subject(:placement_type) { placement_need.placement_type }

    let(:placement_need) { described_class.new(emergency: true) }

    it "returns the name of the selected placement type" do
      is_expected.to eql("emergency")
    end
  end
end
