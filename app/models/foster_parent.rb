class FosterParent < ApplicationRecord
  belongs_to :user, optional: false, inverse_of: :foster_parent
  has_many :placements, inverse_of: :foster_parent
  has_many :children, through: :placements

  validates :first_name, :last_name, presence: true
end
