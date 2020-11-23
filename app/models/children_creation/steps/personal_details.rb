module ChildrenCreation
  module Steps
    class PersonalDetails < ::Wizard::Step
      include ActiveRecord::AttributeAssignment

      attribute :first_name, :string
      attribute :last_name, :string
      attribute :date_of_birth, :date

      validates :first_name, :last_name, :date_of_birth, presence: true

      def reviewable_answers
        {
          "name" => "#{first_name} #{last_name}",
          "date_of_birth" => date_of_birth,
        }
      end
    end
  end
end
