require "rails_helper"

RSpec.describe FosterParent, type: :model do
  it { is_expected.to belong_to(:user).required.inverse_of(:foster_parent) }
  it { is_expected.to have_many(:placements).inverse_of(:foster_parent) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
