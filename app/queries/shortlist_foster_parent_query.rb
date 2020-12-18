class ShortlistFosterParentQuery
  def initialize(placement_types: [])
    @placement_types = placement_types
  end

  def call
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
    return relation if @placement_types.empty?

    relation
      .joins(:placement_suitability)
      .merge(placement_types_condition)
  end

  def placement_types_condition
    @placement_types.inject(PlacementSuitability.none) do |condition, placement_type|
      condition.or(PlacementSuitability.where(placement_type => true))
    end
  end
end
