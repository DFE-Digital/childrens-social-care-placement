require "rails_helper"

RSpec.describe TmpShortlist, type: :model do
  subject(:model) { described_class.new(child: child) }

  let(:child) { build_stubbed(:child) }

  describe "#id" do
    it "returns the same id as the child object" do
      expect(model.id).to eql(child.id)
    end
  end

  describe "#child" do
    it "returns the child assigned during initialisation" do
      expect(model.child).to eql(child)
    end
  end
end
