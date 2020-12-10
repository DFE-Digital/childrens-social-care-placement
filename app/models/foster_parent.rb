class FosterParent < ApplicationRecord
  include NameIdentifiable

  belongs_to :user, optional: false, inverse_of: :foster_parent
  has_many :placements, inverse_of: :foster_parent
  has_many :children, through: :placements
  has_many :diary_entries, through: :placements
  has_one :placement_suitability, inverse_of: :foster_parent
  has_and_belongs_to_many :shortlists, join_table: "shortlisted_foster_parents"
end
