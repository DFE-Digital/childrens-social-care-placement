require "rails_helper"

RSpec.describe Matchmaker, type: :model do
  it { is_expected.to belong_to(:user).required.inverse_of(:matchmaker) }

  it_behaves_like "name identifiable model" do
    let(:model_class) { described_class }
  end
end
