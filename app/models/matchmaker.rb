class Matchmaker < ApplicationRecord
  belongs_to :user, optional: false, inverse_of: :matchmaker

  validates :first_name, :last_name, presence: true
end
