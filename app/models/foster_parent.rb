class FosterParent < ApplicationRecord
  include NameIdentifiable

  belongs_to :user, optional: false, inverse_of: :foster_parent
  has_many :placements, inverse_of: :foster_parent
  has_many :children, through: :placements
  has_many :diary_entries, through: :placements
end
