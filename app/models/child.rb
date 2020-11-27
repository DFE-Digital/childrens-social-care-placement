class Child < ApplicationRecord
  include NameIdentifiable

  has_many :placements, inverse_of: :child
  has_many :foster_parents, through: :placements
  has_one :placement_need_profile

  validates :date_of_birth, presence: true
end
