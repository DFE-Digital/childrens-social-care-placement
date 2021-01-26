class Shortlist < ApplicationRecord
  belongs_to :placement_need, inverse_of: :shortlist
  has_many :shortlisted_foster_parents, inverse_of: :shortlist
end
