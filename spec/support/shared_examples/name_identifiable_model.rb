RSpec.shared_examples "name identifiable model" do
  describe "validation" do
    subject { model_class.new }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "#full_name" do
    subject { model.full_name }

    context "when middle name is set" do
      let(:model) { model_class.new(first_name: "Peter", middle_name: "Michael", last_name: "Smith") }

      it "returns first, middle and last names joined" do
        is_expected.to eql("Peter Michael Smith")
      end
    end

    context "when middle name is not set" do
      let(:model) { model_class.new(first_name: "Peter", last_name: "Smith") }

      it "returns first and last names joined" do
        is_expected.to eql("Peter Smith")
      end
    end
  end
end
