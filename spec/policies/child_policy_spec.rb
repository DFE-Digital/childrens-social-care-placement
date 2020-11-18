require "rails_helper"

RSpec.describe ChildPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { Shortlist.new(child: child) }
  let(:child) { build_stubbed(:child) }

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_actions(%i[new create]) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_actions(%i[new create]) }
  end
end
