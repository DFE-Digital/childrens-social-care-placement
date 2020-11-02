class Placement < ApplicationRecord
  belongs_to :foster_parent, optional: false, inverse_of: :placements
  belongs_to :child, optional: false, inverse_of: :placements
  has_many :diary_logs, inverse_of: :placement
end
