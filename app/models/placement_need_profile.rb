class PlacementNeed < ApplicationRecord
  belongs_to :child, inverse_of: :placement_need
end
