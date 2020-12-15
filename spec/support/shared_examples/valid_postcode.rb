RSpec.shared_examples "valid_postcode" do
  describe "validation" do
    it { is_expected.to_not allow_value("", "gibberish", nil).for :postcode }
    it { is_expected.to allow_value("Eh3 9eH", "TR11uz").for :postcode }

    context "when nil value" do
      it "only calls check_parsed_postcode validation" do
        subject.postcode = nil
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
end
