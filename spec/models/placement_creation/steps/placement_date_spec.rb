require "rails_helper"

RSpec.describe PlacementCreation::Steps::PlacementDate do
  include_context "wizard step"
  it_behaves_like "a wizard step"

  context "attributes" do
    it { is_expected.to respond_to :placement_date }
  end

  describe "placement_date" do
    it { is_expected.to_not allow_value(nil).for :placement_date }
    it { is_expected.to_not allow_value(Time.zone.yesterday).for :placement_date }
    it { is_expected.to allow_value(Time.zone.today).for :placement_date }
    it { is_expected.to allow_value(Time.zone.tomorrow).for :placement_date }
  end

  describe "#reviewable answers" do
    let(:date) { Time.zone.tomorrow }
    subject { instance.reviewable_answers }
    before { instance.placement_date = date }
    it { is_expected.to eq({ "placement_date" => date }) }
  end

  context "when validating a date in the past" do
    it "returns the correct custom error" do
      subject.placement_date = Time.zone.yesterday
      subject.valid?
      expect(subject.errors[:placement_date]).to include("Date can't be in the past")
    end
  end

  context "when validating a nil date" do
    it "returns the correct custom error" do
      subject.placement_date = nil
      subject.valid?
      expect(subject.errors[:placement_date]).to include("Enter a placement date")
    end
  end
end
