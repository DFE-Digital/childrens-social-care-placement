module ChildrenCreation
  class Wizard < ::Wizard::Base
    self.steps = [
      Steps::PersonalDetails,
    ].freeze

  private

    def do_complete
      Child.create!(
        first_name: @store.data["first_name"],
        last_name: @store.data["last_name"],
      )
    end
  end
end
