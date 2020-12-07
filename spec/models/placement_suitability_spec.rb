require "rails_helper"

RSpec.describe PlacementSuitability, type: :model do
  include_context "sanitize fields", %i[address_line_1 address_line_2 address_city address_county address_postcode]

  it { is_expected.to belong_to(:foster_parent).required.inverse_of(:placement_suitability) }

  it_behaves_like "boolean options list" do
    subject { create(:placement_suitability) }
  end

  describe "#available" do
    it { is_expected.to_not allow_value(nil).for :available }
    it { is_expected.to allow_values(true, false).for :available }
  end

  describe "#address details" do
    it { is_expected.to_not allow_values("", nil, "a" * 1025).for :address_line_1 }
    it { is_expected.to allow_values("7", "7 Main Street").for :address_line_1 }

    it { is_expected.to_not allow_values("a" * 1025).for :address_line_2 }

    it { is_expected.to_not allow_values("", nil, "a" * 129).for :address_city }
    it { is_expected.to allow_value("Manchester").for :address_city }

    it { is_expected.to_not allow_values("", nil, "a" * 129).for :address_county }
    it { is_expected.to allow_value("Up North").for :address_county }

    it { is_expected.to_not allow_values("", nil).for :address_postcode }
    it { is_expected.to allow_values("eh3 9eh", "TR1 1XY", "hs13eq").for :address_postcode }
  end

  describe "#placement_types" do
    subject(:placement_types) { placement_suitability.placement_types }

    context "when no placement type boolean field is set" do
      let(:placement_suitability) { described_class.new }

      it "returns an empty array" do
        is_expected.to eql([])
      end
    end

    context "when one or more placement type boolean fields are set" do
      let(:placement_suitability) { described_class.new(short_break: true, remand: true) }

      it "returns the strings as an array" do
        is_expected.to eql(%w[short_break remand])
      end
    end
  end
end
