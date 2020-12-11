class PlacementSuitability < ApplicationRecord
  belongs_to :foster_parent, inverse_of: :placement_suitability

  validates_with AnyBooleanValidator, fields: PlacementNeed::OPTIONS

  before_validation :sanitize_input, :sanitize_postcode

  validates :available, inclusion: [true, false]

  validates :address_line_1, presence: true, length: { maximum: 1024 }
  validates :address_line_2, length: { maximum: 1024 }
  validates :address_city, presence: true, length: { maximum: 128 }
  validates :address_county, presence: true, length: { maximum: 128 }
  validate :check_parsed_postcode
  validates :address_postcode, postcode: true

  def placement_types
    PlacementNeed::OPTIONS.map { |pt| send(pt) == true ? pt : nil }.compact
  end

private

  def sanitize_input
    self.address_line_1 = address_line_1.to_s.strip.presence if address_line_1
    self.address_line_2 = address_line_2.to_s.strip.presence if address_line_2
    self.address_city = address_city.to_s.strip.presence if address_city
    self.address_county = address_county.to_s.strip.presence if address_county
  end

  def sanitize_postcode
    self.address_postcode = UKPostcode.parse(address_postcode.gsub(" ", "")).presence if address_postcode
  end

  def check_parsed_postcode
    return unless address_postcode

    unless UKPostcode.parse(address_postcode).full_valid?
      errors.add(:address_postcode, :invalid)
    end
  end
end
