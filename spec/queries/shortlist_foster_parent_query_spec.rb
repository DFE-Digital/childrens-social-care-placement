require "rails_helper"

RSpec.describe ShortlistFosterParentQuery do
  subject(:query) { described_class.new(**params) }

  describe "#call" do
    subject(:call) { query.call }

    let!(:available_short_term) { create(:placement_suitability, short_term: true).foster_parent }
    let!(:available_emergency) { create(:placement_suitability, emergency: true).foster_parent }
    let!(:available_remand) { create(:distant_suitability, short_break: true, remand: true).foster_parent }
    let!(:unavailable) do
      create(:placement_suitability, remand: true).foster_parent.tap { |fp| create(:placement, foster_parent: fp) }
    end

    context "when placement_types parameter is set" do
      let(:params) { { placement_types: %w[remand short_term] } }

      it "returns only parents who match any of the placement_types" do
        is_expected.to contain_exactly(available_remand, available_short_term)
      end
    end

    context "when location related parameters are set" do
      let(:params) do
        {
          search_radius: 0.1,
          latitude: placement_need.latitude,
          longitude: placement_need.longitude,
        }
      end
      let(:placement_need) { create(:placement_need) }

      it "returns only parents who are within the search_radius distance from latitude/longitude" do
        is_expected.to contain_exactly(available_short_term, available_emergency)
      end
    end

    context "when parameters are empty or not provided" do
      let(:params) { {} }

      it "returns all available foster parents" do
        is_expected.to contain_exactly(available_short_term, available_emergency, available_remand)
      end
    end
  end
end
