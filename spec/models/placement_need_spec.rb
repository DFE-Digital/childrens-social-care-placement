require "rails_helper"

RSpec.describe PlacementNeed, type: :model do
  it { is_expected.to belong_to(:child).required.inverse_of(:placement_need) }
end
