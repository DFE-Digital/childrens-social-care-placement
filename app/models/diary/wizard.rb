module Diary
  class Wizard < ::Wizard::Base
    self.steps = [
      Steps::SelectEvent,
      Steps::Note,
      Steps::ReviewAnswers,
    ].freeze

    def do_complete
      create_diary_entry
    end

  private

    def create_diary_entry
      DiaryEntry.create!(
        placement_id: @context["placement_id"],
        event: @store.data["event"],
        note: @store.data["entry"],
      )
    end
  end
end
