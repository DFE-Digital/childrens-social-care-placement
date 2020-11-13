RSpec.shared_context "wizard store" do
  let(:backingstore) { { "event_options" => "home_life" } }
  let(:wizardstore) { Wizard::Store.new backingstore }
end

RSpec.shared_context "wizard step" do
  include_context "wizard store"
  let(:attributes) { {} }
  let(:instance) { described_class.new nil, wizardstore, attributes }
  subject { instance }
end

RSpec.shared_examples "a wizard step" do
  it { expect(subject.class).to respond_to :key }
  it { is_expected.to respond_to :save! }
end
