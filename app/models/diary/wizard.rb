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

        # save data here
        create_diary_entry
        @store.purge!
      end
    end

  private

    def create_diary_entry
      DiaryEntry.create!(
        placement_id: @store.data["placement_id"],
        event: @store.data["event"],
        note: @store.data["entry"],
      )
    end
  end
end
