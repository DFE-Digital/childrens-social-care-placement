class Placement < ApplicationRecord
  belongs_to :foster_parent, optional: false, inverse_of: :placements
  belongs_to :placement_need, optional: false, inverse_of: :placement
  has_many :diary_entries, inverse_of: :placement

  delegate :child, to: :placement_need
end
