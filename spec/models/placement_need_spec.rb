require "rails_helper"

RSpec.describe PlacementNeed, type: :model do
  include_context "sanitize postcodes", %i[postcode]
  subject { create(:placement_need) }

  it { is_expected.to belong_to(:child).required.inverse_of(:placement_need) }
  it { is_expected.to have_one(:placement).inverse_of(:placement_need) }
  it { is_expected.to have_one(:shortlist).inverse_of(:placement_need) }

  describe "#placement_date" do
    it { is_expected.to_not allow_value(nil).for :placement_date }
    it { is_expected.to_not allow_value(Time.zone.yesterday).for :placement_date }
  end

  describe "#postcode" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("Eh3 9eH", "TR11uz").for :postcode }

    context "when nil value" do
      it "only calls check_parsed_postcode validation" do
        subject.postcode = nil
        expect(subject).to receive(:check_parsed_postcode).twice
        expect_any_instance_of(PostcodeApi).to_not receive(:postcode_valid?)
        subject.valid?
      end
    end

    context "when correctly formatted but non existent" do
      it "calls postcode validator" do
        subject.postcode = "tr1 1ug"
        expect_any_instance_of(PostcodeApi).to receive(:postcode_valid?).once
        subject.valid?
      end
    end
  end

  describe "#location_radius_miles" do
    it { is_expected.to_not allow_value("", "words", 0, nil, 51).for :location_radius_miles }
    it { is_expected.to allow_value(1, 20, 50).for :location_radius_miles }
  end
end
