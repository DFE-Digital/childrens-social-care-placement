require "rails_helper"

RSpec.describe Child, type: :model do
  subject(:model) { build(:child) }

  it { is_expected.to have_many(:placements).inverse_of(:child) }
  it { is_expected.to have_many(:foster_parents).through(:placements) }

  it { is_expected.to define_enum_for(:gender).with_values(male: 1, female: 2, other: 3) }

  it { is_expected.to validate_presence_of(:date_of_birth) }
  it { is_expected.to validate_presence_of(:gender) }

  it_behaves_like "name identifiable model" do
    let(:model_class) { described_class }
  end
end
