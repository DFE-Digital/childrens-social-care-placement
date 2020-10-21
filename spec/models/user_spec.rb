require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:foster_parent).inverse_of(:user) }
end
