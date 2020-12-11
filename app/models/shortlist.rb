class Shortlist < ApplicationRecord
  belongs_to :placement_need, inverse_of: :shortlist
  has_and_belongs_to_many :foster_parents, join_table: "shortlisted_foster_parents"
end
