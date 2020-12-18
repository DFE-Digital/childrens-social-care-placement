require "rails_helper"

RSpec.describe ShortlistPolicy do
  subject(:policy) { described_class.new(auth_context, record) }

  let(:auth_context) { AuthorisationContext.new(user) }
  let(:record) { Shortlist.new }

  context "for matchmaker" do
    let(:user) { create(:matchmaker).user }

    it { is_expected.to permit_actions(%i[create edit update]) }
  end

  context "for other types of users" do
    let(:user) { FactoryBot.build_stubbed(:user) }

    it { is_expected.to forbid_actions(%i[create edit update]) }
  end

  describe described_class::Scope do
    let!(:shortlists) { create_list(:shortlist, 2) }

    describe "#resolve" do
      subject(:resolve) { described_class.new(auth_context, Shortlist).resolve }

      context "for matchmaker" do
        let(:user) { create(:matchmaker).user }

        it "allows all shortlists to be returned" do
          is_expected.to match_array(shortlists)
        end
      end

      context "for other types of users" do
        let(:user) { FactoryBot.build_stubbed(:user) }

        it { is_expected.to be_empty }
      end
    end
  end
end
