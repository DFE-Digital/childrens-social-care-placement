module Diary
  class Wizard < ::Wizard::Base
    self.steps = [
      Steps::SelectEvent,
    ].freeze

    def complete!
      super.tap do |result|
        break unless result

        # save data to postgres here
        @store.purge!
      end
    end
  end
end
