require "rails_helper"

RSpec.describe Forms::ShortlistFilter do
  subject(:filter) { described_class.new(shortlist) }

  let(:shortlist) { create(:shortlist, placement_types: "respite,remand") }

  describe "#initialize" do
    it "extracts and assigns placement_types attribute as an array from the Shortlist#placement_types field" do
      expect(filter.placement_types).to eql(%w[respite remand])
    end
  end

  describe "#save!" do
    before do
      filter.assign_attributes(placement_types: %w[emergency short_term])
      filter.save!
    end

    it "stores the placement_types attribute into the Shortlist#placement_types string field" do
      expect(shortlist.reload.placement_types).to eql("emergency,short_term")
    end
  end
end
