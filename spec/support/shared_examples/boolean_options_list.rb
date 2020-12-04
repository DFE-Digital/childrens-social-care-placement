RSpec.shared_examples "boolean options list" do
  describe "validation" do
    context "with an option" do
      it { is_expected.to be_valid }
    end

    context "with no options" do
      it "is invalid" do
        subject.emergency = false
        expect(subject).to be_invalid
      end
    end
  end
end
