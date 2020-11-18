class Child < ApplicationRecord
  include NameIdentifiable

  has_many :placements, inverse_of: :child
  has_many :foster_parents, through: :placements
end
