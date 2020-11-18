class Matchmaker < ApplicationRecord
  include NameIdentifiable

  belongs_to :user, optional: false, inverse_of: :matchmaker
end
