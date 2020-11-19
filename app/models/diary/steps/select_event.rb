module Diary::Steps
  class SelectEvent < Wizard::Step
    attribute :event, :string

    EVENT_OPTIONS = { home_life: "Home life", school_life: "School life", sports: "Sports", physical_health: "Physical health", emotional_health: "Emotional health" }.freeze

    validates :event, inclusion: { in: EVENT_OPTIONS.values }

    def reviewable_answers
      {
        "event" => event,
      }
    end
  end
end
