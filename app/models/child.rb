class Child < ApplicationRecord
  has_many :placements, inverse_of: :child
  has_many :foster_parents, through: :placements

  validates :first_name, :last_name, presence: true
end
