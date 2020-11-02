class Child < ApplicationRecord
  has_many :placements, inverse_of: :child

  validates :first_name, :last_name, presence: true
end
