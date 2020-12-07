module PlacementCreation
  module Steps
    class PlacementDate < ::Wizard::Step
      include ActiveRecord::AttributeAssignment

      attribute :placement_date, :date

      validates :placement_date, presence: true
      validate :date_in_future

      def reviewable_answers
        {
          "placement_date" => placement_date,
        }
      end

    private

      def date_in_future
        if placement_date.present? && placement_date < Time.zone.today
          errors.add(:placement_date, "Date can't be in the past")
        end
      end
    end
  end
end
