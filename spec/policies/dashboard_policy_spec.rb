require "rails_helper"

RSpec.describe DashboardPolicy do
  subject(:policy) { described_class.new(auth_context, :dashboard) }

  let(:auth_context) { AuthorisationContext.new(user) }

  context "for foster parent" do
    let(:user) { create(:foster_parent).user }

    it { is_expected.to permit_action(:foster_parent) }
    it { is_expected.to forbid_action(:matchmaker) }
  end

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_action(:matchmaker) }
    it { is_expected.to forbid_action(:foster_parent) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_actions(%i[foster_parent matchmaker]) }
  end
end
