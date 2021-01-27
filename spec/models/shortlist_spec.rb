require "rails_helper"

RSpec.describe Shortlist, type: :model do
  it { is_expected.to belong_to(:placement_need).inverse_of(:shortlist).required }
  it { is_expected.to have_many(:shortlisted_foster_parents).inverse_of(:shortlist) }
  it { is_expected.to have_many(:foster_parents).through(:shortlisted_foster_parents) }
end
