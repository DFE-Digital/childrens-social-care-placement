module Forms
  class ShortlistFilter
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :placement_types, :search_radius, :latitude, :longitude

    def initialize(shortlist)
      @shortlist = shortlist

      @placement_types = @shortlist.placement_types&.split(",") || []
      @search_radius = @shortlist.placement_need.location_radius_miles
      @latitude = @shortlist.placement_need.latitude
      @longitude = @shortlist.placement_need.longitude
    end

    def save!
      @shortlist.update(placement_types: @placement_types.reject(&:blank?).join(","))
    end
  end
end
