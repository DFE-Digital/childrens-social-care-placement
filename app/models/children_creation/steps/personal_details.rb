module ChildrenCreation
  module Steps
    class PersonalDetails < ::Wizard::Step
      include ActiveRecord::AttributeAssignment

      attribute :first_name, :string
      attribute :last_name, :string
      attribute :date_of_birth, :date
      attribute :gender, :integer

      validates :first_name, :last_name, :date_of_birth, :gender, presence: true

      def reviewable_answers
        {
          "name" => "#{first_name} #{last_name}",
          "date_of_birth" => date_of_birth,
          "gender" => I18n.t(gender, scope: "helpers.label.children_creation_steps_personal_details.gender_options"),
        }
      end
    end
  end
end
