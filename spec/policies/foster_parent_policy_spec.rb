require "rails_helper"

RSpec.describe FosterParentPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { create(:foster_parent) }

  context "for foster parent" do
    let(:user) { create(:user) }
    let(:foster_parent) { create(:foster_parent, user: user) }

    context "when trying to access themselves" do
      let(:record) { foster_parent }

      it { is_expected.to permit_action(:show) }
    end

    context "when trying to access other foster parents" do
      it { is_expected.to forbid_action(:show) }
    end
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_action(:show) }
  end
end
