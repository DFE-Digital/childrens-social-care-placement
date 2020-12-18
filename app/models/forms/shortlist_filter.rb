module Forms
  class ShortlistFilter
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :placement_types
  end
end
