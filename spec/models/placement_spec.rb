require "rails_helper"

RSpec.describe Placement, type: :model do
  it { is_expected.to belong_to(:foster_parent).required.inverse_of(:placements) }
  it { is_expected.to belong_to(:placement_need).required.inverse_of(:placement) }
  it { is_expected.to have_many(:diary_entries).inverse_of(:placement) }

  it { is_expected.to delegate_method(:child).to(:placement_need) }
end
