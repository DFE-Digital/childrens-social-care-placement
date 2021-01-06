class ShortlistFosterParentQuery
  def initialize(placement_types: [], latitude: nil, longitude: nil, search_radius: nil)
    @placement_types = placement_types
    @latitude = latitude
    @longitude = longitude
    @search_radius = search_radius
  end

  def call
    FosterParent
      .joins(:placement_suitability)
      .includes(:placement_suitability)
      .yield_self(&method(:placements_part))
      .yield_self(&method(:placement_types_part))
      .yield_self(&method(:location_part))
  end

private

  def placements_part(relation)
    relation
      .left_outer_joins(:placements)
      .where(placements: { foster_parent_id: nil })
  end

  def placement_types_part(relation)
    return relation if @placement_types.empty?

    relation.merge(placement_types_condition)
  end

  def placement_types_condition
    @placement_types.inject(PlacementSuitability.none) do |condition, placement_type|
      condition.or(PlacementSuitability.where(placement_type => true))
    end
  end

  def location_part(relation)
    return relation if @latitude.nil? || @longitude.nil? || @search_radius.nil?

    relation.merge(PlacementSuitability.near([@latitude, @longitude], @search_radius))
  end
end
