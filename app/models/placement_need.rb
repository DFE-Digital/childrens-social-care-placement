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

  before_validation :sanitize_input
  before_validation :insert_boolean

  validates_with AnyBooleanValidator, fields: OPTIONS

  validates :placement_date, :criteria, presence: true
  validates :criteria, presence: true
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

  def insert_boolean
    self["#{self.criteria}"] = true if attribute_present?("criteria")
  end
end
