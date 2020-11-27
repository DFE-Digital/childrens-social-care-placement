class PlacementNeedProfile < ApplicationRecord
  belongs_to :child, inverse_of: :placement_need_profile
end
