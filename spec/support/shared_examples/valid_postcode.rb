RSpec.shared_examples "valid_postcode" do |field|
  describe "validation" do
    setter = "#{field}="

    it { is_expected.to_not allow_value("", "gibberish", nil).for field.to_sym }
    it { is_expected.to allow_value("Eh3 9eH", "TR11uz").for field.to_sym }

    context "when nil value" do
      it "does not call postcode.io api" do
        subject.send(setter, nil)
        expect_any_instance_of(PostcodeApi).to_not receive(:postcode_valid?)
        subject.valid?
      end
    end

    context "when correctly formatted but non existent" do
      it "calls postcode.io api" do
        subject.send(setter, "tr1 1ug")
        expect_any_instance_of(PostcodeApi).to receive(:postcode_valid?).once
        subject.valid?
      end
    end
  end
end
