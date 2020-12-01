class Child < ApplicationRecord
  include NameIdentifiable

  has_many :placements, inverse_of: :child
  has_many :foster_parents, through: :placements
  has_one :placement_need, inverse_of: :child

  enum gender: { male: 1, female: 2, other: 3 }

  validates :date_of_birth, :gender, presence: true
end
