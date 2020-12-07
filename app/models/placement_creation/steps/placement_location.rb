module PlacementCreation
  module Steps
    class PlacementLocation < ::Wizard::Step
      attribute :postcode, :date
      attribute :location_radius_miles, :integer

      validates :postcode, format: { with: /^([A-Z]{1,2}\d[A-Z\d]? ?\d[A-Z]{2}|GIR ?0A{2})$/i, multiline: true }
      validates :location_radius_miles, numericality: { only_integer: true, greater_than: 0, less_than: 51 }

      def reviewable_answers
        {
          "postcode" => postcode,
          "search_radius" => location_radius_miles,
        }
      end
    end
  end
end
