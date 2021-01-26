require "rails_helper"

RSpec.describe ShortlistedFosterParent, type: :model do
  it { is_expected.to belong_to(:foster_parent).required.inverse_of(:shortlisted_foster_parents) }
  it { is_expected.to belong_to(:shortlist).required.inverse_of(:shortlisted_foster_parents) }
end
