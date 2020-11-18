require "rails_helper"

RSpec.describe Diary::Steps::LogEntry do
  include_context "wizard step"
  it_behaves_like "a wizard step"

  context "attributes" do
    it { is_expected.to respond_to :entry }
  end

  describe "entry" do
    it { is_expected.to validate_length_of(:entry).is_at_least(10) }
  end
end
