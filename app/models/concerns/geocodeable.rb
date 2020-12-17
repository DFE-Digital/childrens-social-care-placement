module Geocodeable
  extend ActiveSupport::Concern

  included do
    after_validation :geocode
    geocoded_by :address, if: ->(obj) { obj.address.present? and obj.address_changed? }
  end
end
