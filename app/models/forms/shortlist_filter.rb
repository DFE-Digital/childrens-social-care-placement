module Forms
  class ShortlistFilter
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :placement_types, :search_radius, :latitude, :longitude
  end
end
