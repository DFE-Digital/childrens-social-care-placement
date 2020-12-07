require "rails_helper"

RSpec.describe PlacementCreation::Steps::PlacementType do
  include_context "wizard step"
  it_behaves_like "a wizard step"

  context "attributes" do
    it { is_expected.to respond_to :criteria }
  end

  describe "criteria" do
    it { is_expected.to_not allow_value(nil, "").for :criteria }
    it { is_expected.to allow_values(PlacementNeed::OPTIONS).for :criteria }
  end

  describe "#reviewable answers" do
    let(:option) { PlacementNeed::OPTIONS.first }
    subject { instance.reviewable_answers }
    before { instance.criteria = option }
    it { is_expected.to eq({ "placement_type" => option }) }
  end

  context "when validating nil options" do
    it "returns the correct custom error" do
      subject.criteria = nil
      subject.valid?
      expect(subject.errors[:criteria]).to include("Select an option from the list")
    end
  end
end
