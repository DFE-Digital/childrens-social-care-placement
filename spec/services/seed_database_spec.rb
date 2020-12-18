require "rails_helper"

RSpec.describe SeedDatabase do
  subject { described_class.new(TestSeedData.new) }

  describe "#call" do
    it "seeds the database from the TestSeedData class" do
      expect(User.count).to eq 0
      subject.call
      expect(User.count).to eq 3
      expect(User.first.email).to eq("r.johnston@example.com")
      expect(FosterParent.count).to eq 2
      expect(FosterParent.first.first_name).to eq("Rodger")
      expect(Matchmaker.count).to eq 1
      expect(Matchmaker.first.first_name).to eq("Paul")
      expect(Child.count).to eq 1
      expect(Child.first.first_name).to eq("Fredrick")
      expect(Placement.count).to eq 1
      expect(DiaryEntry.count).to eq 10
      expect(PlacementNeed.count).to eq 1
    end
  end
end
