class PlacementNeed < ApplicationRecord
  OPTIONS = %w[
    long_term
    short_term
    emergency
    respite
    short_break
    remand
    specialist_theraputic
    parent_and_child
  ].freeze

  belongs_to :child, inverse_of: :placement_need
  has_one :shortlist, inverse_of: :placement_need, required: false

  before_validation :sanitize_input

  validates :placement_date, :criteria, presence: true
  validates :location_radius_miles, numericality: { only_integer: true, greater_than: 0, less_than: 51 }
  validate :date_in_future
  validates :postcode, format: { with: /^([A-Z]{1,2}\d[A-Z\d]? ?\d[A-Z]{2}|GIR ?0A{2})$/i, multiline: true }

private

  def date_in_future
    if placement_date.present? && placement_date < Time.zone.today
      errors.add(:placement_date, "Date can't be in the past")
    end
  end

  def sanitize_input
    self.postcode = postcode.to_s.strip.presence if postcode
  end
end
