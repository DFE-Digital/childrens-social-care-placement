class ShortlistedFosterParent < ApplicationRecord
  belongs_to :foster_parent, optional: false, inverse_of: :shortlisted_foster_parents
  belongs_to :shortlist, optional: false, inverse_of: :shortlisted_foster_parents
end
