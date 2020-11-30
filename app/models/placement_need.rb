class PlacementNeed < ApplicationRecord
  belongs_to :child, inverse_of: :placement_need

  validates_with AnyBooleanValidator, fields: %w[
    long_term
    short_term
    emergency
    respite
    short_break
    remand
    specialist_theraputic
    parent_and_child
  ]

  validates :placement_date, presence: true
  validate :date_in_future

  validates :postcode, format: { with: /^([A-Z]{1,2}\d[A-Z\d]? ?\d[A-Z]{2}|GIR ?0A{2})$/i, multiline: true, message: "Enter a valid postcode" }

  def date_in_future
    if placement_date.present? && placement_date < Time.zone.today
      errors.add(:placement_date, "Date can't be in the past")
    end
  end
end
