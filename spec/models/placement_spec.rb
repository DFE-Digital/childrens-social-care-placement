require "rails_helper"

RSpec.describe Placement, type: :model do
  it { is_expected.to belong_to(:foster_parent).required.inverse_of(:placements) }
  it { is_expected.to belong_to(:child).required.inverse_of(:placements) }
  it { is_expected.to have_many(:diary_entries).inverse_of(:placement) }
end
