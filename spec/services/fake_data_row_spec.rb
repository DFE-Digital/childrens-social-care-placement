require "rails_helper"

RSpec.describe FakeDataRow do
  subject { described_class.new(2) }

  describe "#call" do
    it "passes @number to the block" do
      expect(subject.call {}).to eq 2
    end

    it "yields @number of Hashes" do
      expect { |block| subject.call(&block) }.to yield_successive_args(Hash, Hash)
    end

    it "calls the private method each time" do
      expect(subject).to receive(:foster_parent_and_child_hash).twice
      subject.call {}
    end

    it "yields foster_parent_and_child_hash" do
      a = {}
      stubbed_hash = {
        first_name: "jo",
        last_name: "bloggs",
        email: "jo@bloggs.com",
        child_first_name: "tom",
        child_last_name: "mulligan",
      }
      allow(subject).to receive(:foster_parent_and_child_hash).and_return(stubbed_hash)
      subject.call { |x| a = x }
      expect(a).to eq(stubbed_hash)
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
