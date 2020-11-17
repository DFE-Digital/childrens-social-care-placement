class Child < ApplicationRecord
  has_many :placements, inverse_of: :child
  has_many :foster_parents, through: :placements

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
