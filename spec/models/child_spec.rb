require "rails_helper"

RSpec.describe Child, type: :model do
  subject(:model) { build(:child) }

  it { is_expected.to have_many(:placements).inverse_of(:child) }
  it { is_expected.to have_many(:foster_parents).through(:placements) }

  it_behaves_like "name identifiable model" do
    let(:model_class) { described_class }
  end
end
