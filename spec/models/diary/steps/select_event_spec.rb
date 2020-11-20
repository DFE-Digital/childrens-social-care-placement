require "rails_helper"

RSpec.describe Diary::Steps::SelectEvent do
  include_context "wizard step"
  it_behaves_like "a wizard step"

  context "attributes" do
    it { is_expected.to respond_to :event }
    it { is_expected.to respond_to :placement_id }
  end

  describe "event_options" do
    it { is_expected.to_not allow_values("random", "", nil).for :event }
    it { is_expected.to allow_values(*Diary::Steps::SelectEvent::EVENT_OPTIONS.values).for :event }
  end
end
