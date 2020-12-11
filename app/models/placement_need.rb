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

  before_validation :sanitize_postcode

  validates :placement_date, :criteria, presence: true
  validates :location_radius_miles, numericality: { only_integer: true, greater_than: 0, less_than: 51 }
  validate :date_in_future
  validate :parse_postcode
  validates :postcode, postcode: true

private

  def date_in_future
    if placement_date.present? && placement_date < Time.zone.today
      errors.add(:placement_date, "Date can't be in the past")
    end
  end

  def sanitize_postcode
    self.postcode = UKPostcode.parse(postcode.gsub(" ", "")).presence if postcode
  end

  def parse_postcode
    return unless postcode

    unless UKPostcode.parse(postcode).full_valid?
      errors.add(:postcode, :invalid)
    end
  end
end
