module PlacementCreation
  module Steps
    class PlacementType < ::Wizard::Step
      attribute :criteria, :string

      validates :criteria, presence: true

      def reviewable_answers
        {
          "placement_type" => criteria,
        }
      end
    end
  end
end
