module Diary
  class Wizard < ::Wizard::Base
    self.steps = [
      Steps::SelectEvent,
      Steps::LogEntry,
      Steps::ReviewAnswers,
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
