module Forms
  class ShortlistFilter
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :placement_types

    def foster_families
      FosterParent
        .includes(:placement_suitability)
        .yield_self(&method(:placements_part))
        .yield_self(&method(:placement_suitability_part))
    end

  private

    def placements_part(relation)
      relation
        .left_outer_joins(:placements)
        .where(placements: { foster_parent_id: nil })
    end

    def placement_suitability_part(relation)
      return relation if sanitised_placement_types.empty?

      relation
        .joins(:placement_suitability)
        .merge(placement_types_condition)
    end

    def placement_types_condition
      sanitised_placement_types.inject(PlacementSuitability.none) do |condition, placement_type|
        condition.or(PlacementSuitability.where(placement_type => true))
      end
    end

    def sanitised_placement_types
      @sanitised_placement_types ||= placement_types&.select { |pt| PlacementNeed::PLACEMENT_TYPES.include?(pt) } || []
    end
  end
end
