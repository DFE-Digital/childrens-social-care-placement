require "rails_helper"

RSpec.describe FosterParent, type: :model do
  it { is_expected.to belong_to(:user).required.inverse_of(:foster_parent) }
  it { is_expected.to have_many(:placements).inverse_of(:foster_parent) }
  it { is_expected.to have_many(:shortlisted_foster_parents).inverse_of(:foster_parent) }

  it_behaves_like "name identifiable model" do
    let(:model_class) { described_class }
  end
end
