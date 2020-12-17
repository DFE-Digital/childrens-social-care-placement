module Geocodeable
  extend ActiveSupport::Concern
  # geocoder expects coordinates as [lat, long]

  included do
    geocoded_by :address
    after_validation :geocode, if: ->(obj) { obj.address.present? }
  end
end
