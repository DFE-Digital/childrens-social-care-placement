require "rails_helper"

RSpec.describe PlacementCreation::Steps::PlacementLocation do
  include_context "wizard step"
  it_behaves_like "a wizard step"

  context "attributes" do
    it { is_expected.to respond_to :postcode }
    it { is_expected.to respond_to :location_radius_miles }
  end

  describe "postcode" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("eh3 9eh", "TR1 1XY", "hs13eq").for :postcode }
  end

  describe "#location_radius_miles" do
    it { is_expected.to_not allow_value("", "words", 0, nil, 51).for :location_radius_miles }
    it { is_expected.to allow_value(1, 20, 50).for :location_radius_miles }
  end

  describe "#reviewable answers" do
    let(:post_code) { "TR1 1UZ" }
    let(:radius) { 10 }
    subject { instance.reviewable_answers }
    before do
      instance.postcode = post_code
      instance.location_radius_miles = radius
    end
    it {
      is_expected.to eq({
        "postcode" => post_code,
        "search_radius" => radius,
      })
    }
  end

  context "when validating nil options" do
    it "returns the correct custom error" do
      subject.postcode = nil
      subject.location_radius_miles = nil
      subject.valid?
      expect(subject.errors[:postcode]).to include("Enter a valid postcode")
      expect(subject.errors[:location_radius_miles]).to include("Enter a number between 1 and 50")
    end
  end
end
