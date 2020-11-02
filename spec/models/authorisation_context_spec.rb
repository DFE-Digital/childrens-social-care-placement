require "rails_helper"

RSpec.describe AuthorisationContext do
  subject(:user_context) { described_class.new(user) }

  let(:user) { create(:user) }

  describe "#role_model" do
    context "when user has a foster parent" do
      let!(:foster_parent) { create(:foster_parent, user: user) }

      it "returns the FosterParent model" do
        expect(user_context.role_model).to eql(foster_parent)
      end
    end

    context "when user does not have any linked model" do
      it "returns the User model itself" do
        expect(user_context.role_model).to eql(user)
      end
    end
  end
end
