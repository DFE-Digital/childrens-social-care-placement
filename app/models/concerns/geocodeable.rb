module Geocodeable
  extend ActiveSupport::Concern
  # geocoder expects coordinates as [lat, long]

  included do
    after_validation :geocode
    geocoded_by :address, if: ->(obj) { obj.address.present? and obj.address_changed? }
  end
end
