require "rails_helper"

RSpec.describe ShortlistedFosterParentPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { ShortlistedFosterParent.new }

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_action(:create) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_action(:create) }
  end
end
