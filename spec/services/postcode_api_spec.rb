require "rails_helper"

RSpec.describe PostcodeApi do
  subject { described_class.new("TR1 1uf") }

  describe "#postcode_valid?" do
    context "with an existing postcode" do
      it "returns true" do
        expect(subject.postcode_valid?).to be true
      end
    end

    context "with a non existant postcode" do
      subject { described_class.new("GIBBERISH") }
      it "returns false" do
        expect(subject.postcode_valid?).to be false
      end
    end
  end
end
