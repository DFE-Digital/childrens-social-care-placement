require "rails_helper"

RSpec.describe PlacementNeed, type: :model do
  include_context "sanitize fields", %i[postcode]
  subject { create(:placement_need) }

  it { is_expected.to belong_to(:child).required.inverse_of(:placement_need) }

  describe "#placement_date" do
    it { is_expected.to_not allow_value(nil).for :placement_date }
    it { is_expected.to_not allow_value(Time.zone.yesterday).for :placement_date }
  end

  describe "#postcode" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("eh3 9eh", "TR1  1uf", "hs12ad").for :postcode }
  end

  describe "#location_radius_miles" do
    it { is_expected.to_not allow_value("", "words", 0, nil, 51).for :location_radius_miles }
    it { is_expected.to allow_value(1, 20, 50).for :location_radius_miles }
  end
end
