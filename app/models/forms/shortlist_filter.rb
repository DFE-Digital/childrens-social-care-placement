module Forms
  class ShortlistFilter
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :placement_types

    def initialize(shortlist)
      @shortlist = shortlist

      @placement_types = @shortlist.placement_types&.split(",") || []
    end

    def save!
      @shortlist.update(placement_types: @placement_types.reject(&:blank?).join(","))
    end
  end
end
