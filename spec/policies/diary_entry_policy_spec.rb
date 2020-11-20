require "rails_helper"
require "pundit/rspec"

RSpec.describe DiaryEntryPolicy, type: :policy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }

  let(:foster_parent) { create(:foster_parent, user: user) }
  let(:another_foster_parent) { create(:foster_parent, user: another_user) }

  let(:child) { create(:child) }

  let(:placement) { create(:placement, foster_parent: foster_parent, child: child) }
  let(:another_placement) { create(:placement, foster_parent: another_foster_parent, child: child) }

  let(:auth_context) { AuthorisationContext.new(user) }

  let!(:record) { create(:diary_entry, placement: placement) }
  let!(:record1) { create(:diary_entry, placement: placement) }
  let!(:record2) { create(:diary_entry, placement: another_placement) }

  let(:scope) { described_class::Scope.new(auth_context, DiaryEntry.all).resolve }

  describe "#show?" do
    context "foster_parent with placement" do
      it { is_expected.to permit_action(:show) }
    end

    context "foster_parent with another placement" do
      let(:auth_context) { AuthorisationContext.new(another_user) }
      it { is_expected.to forbid_action(:show) }
    end
  end

  describe "#policy_scope" do
    context "foster_parent with placement" do
      it "allows a subset limited by placement" do
        expect(scope.to_a).to eq [record, record1]
      end
    end
  end
end
