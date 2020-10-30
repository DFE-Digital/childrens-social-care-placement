require "rails_helper"

RSpec.describe ApplicationPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { nil }
  let(:resolved_scope) { described_class::Scope.new(auth_context, relation).resolve }
  let(:relation) { instance_double(ActiveRecord::Relation, none: "NONE") }

  context "for all users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_actions(%i[index show create new update edit destroy]) }

    it "resolves scope to empty relation" do
      expect(resolved_scope).to eql("NONE")
    end
  end
end
