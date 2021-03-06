class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :foster_parent, inverse_of: :user
  has_one :matchmaker, inverse_of: :user
end
