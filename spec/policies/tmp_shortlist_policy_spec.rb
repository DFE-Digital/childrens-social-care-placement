require "rails_helper"

RSpec.describe TmpShortlistPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { TmpShortlist.new(child: child) }
  let(:child) { build_stubbed(:child) }

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_action(:show) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_action(:show) }
  end
end
