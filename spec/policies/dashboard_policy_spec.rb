require "rails_helper"

RSpec.describe DashboardPolicy do
  subject(:policy) { described_class.new(auth_context, :dashboard) }

  let(:auth_context) { AuthorisationContext.new(user) }

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_action(:matchmaker) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_action(:matchmaker) }
  end
end
