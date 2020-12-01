RSpec.shared_examples "boolean options list" do
  describe "validation" do
    subject { model_class.new }

    context "with no options" do
      it { is_expected.to be_invalid }

      it "returns the correct error message" do
        subject.valid?
        expect(subject.errors[:base]).to include("Select an option from the list")
      end
    end

    context "with an option" do
      subject { model_class.new(emergency: true) }

      it "does not raise the any_boolean_validator error" do
        subject.valid?
        expect(subject.errors[:base]).to be_empty
      end
    end
  end
end
