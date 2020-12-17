require "rails_helper"

RSpec.describe Forms::ShortlistFilter do
  subject(:filter) { described_class.new(params) }

  describe "#foster_families" do
    subject(:foster_families) { filter.foster_families }
    let!(:placement_need) { create(:placement_need) }

    let!(:available_short_term_fp) { create(:placement_suitability, short_term: true).foster_parent }
    let!(:available_emergency) { create(:placement_suitability, emergency: true).foster_parent }
    let!(:available_remand) { create(:placement_suitability, short_break: true, remand: true).foster_parent }
    let!(:unavailable_fp) do
      create(:placement_suitability, remand: true).foster_parent.tap { |fp| create(:placement, foster_parent: fp) }
    end

    context "when placement_types attributes is set" do
      context "for foster parents within search radius" do
        let(:params) do
          {
            "search_radius" => placement_need.location_radius_miles,
            "latitude" => placement_need.latitude,
            "longitude" => placement_need.longitude,
            "placement_types" => %w[remand short_term],
          }
        end

        it "returns only parents who match any of the placement_types" do
          is_expected.to contain_exactly(available_remand, available_short_term_fp)
        end
      end

      context "altered search radius" do
        let(:params) do
          {
            "search_radius" => "0.1",
            "latitude" => placement_need.latitude,
            "longitude" => placement_need.longitude,
            "placement_types" => %w[remand short_term],
          }
        end
        let!(:available_remand) { create(:distant_suitability, remand: true).foster_parent }

        it "returns only foster parents within search radius" do
          is_expected.to contain_exactly(available_short_term_fp)
        end
      end
    end

    context "when placement_types attribute is empty" do
      let(:params) { {} }

      it "returns all available foster parents" do
        is_expected.to contain_exactly(available_short_term_fp, available_emergency, available_remand)
      end
    end
  end
end
