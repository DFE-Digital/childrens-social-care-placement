module PlacementCreation
  class Wizard < ::Wizard::Base
    self.steps = [
      Steps::PlacementDate,
      Steps::PlacementType,
      Steps::PlacementLocation,
      # Steps::ReviewAnswers,
    ].freeze

  private

    def do_complete
      PlacementNeed.create!(
        placement_date: @store.data["placement_date"],
        placement_type: @store.data["criteria"],
        postcode: @store.data["postcode"],
        location_radius_miles: @store.data["location_radius_miles"],
      )
    end
  end
end
