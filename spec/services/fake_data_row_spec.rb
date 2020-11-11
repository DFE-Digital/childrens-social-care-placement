require "rails_helper"

RSpec.describe FakeDataRow do
  subject { described_class.new(2) }

  describe "#initialize" do
    it "creates an instance of the class" do
      expect(subject).to be_an_instance_of(FakeDataRow)
    end

    it "sets the @number instance variable" do
      expect(subject.instance_variable_get("@number")).to eq(2)
    end
  end

  describe "#call" do
    it "passes @number to the block" do
      expect(subject.call {}).to eq 2
    end

    it "yields @number of Hashes" do
      expect { |block| subject.call(&block) }.to yield_successive_args(Hash, Hash)
    end
  end

  describe "#foster_parent_and_child_hash" do
    it "returns a Hash of fake data" do
      expect(subject.send(:foster_parent_and_child_hash)).to be_a(Hash)
    end

    it "has 5 key-value pairs" do
      expect(subject.send(:foster_parent_and_child_hash).length).to eq(5)
    end
  end
end
