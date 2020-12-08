require "rails_helper"

RSpec.describe ChildHelper, type: :helper do
  subject { create(:child) }

  describe "#full_name" do
    it "returns the subjects full_name" do
      expect(full_name(subject.id)).to eq "Rosie Child"
    end
  end
end
