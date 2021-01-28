class FosterParent < ApplicationRecord
  include NameIdentifiable

  belongs_to :user, optional: false, inverse_of: :foster_parent
  has_many :placements, inverse_of: :foster_parent
  has_one :placement_suitability, inverse_of: :foster_parent
  has_many :shortlisted_foster_parents, inverse_of: :foster_parent
end
