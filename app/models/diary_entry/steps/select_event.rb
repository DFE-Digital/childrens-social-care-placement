module DiaryEntry::Steps
  class SelectEvent < Wizard::Step
    attribute :event, :string

    EVENT_OPTIONS = { home_life: "home_life", school_life: "school_life", sports: "sports", physical_health: "physical_health", emotional_health: "emotional_health" }.freeze

    validates :event, inclusion: { in: EVENT_OPTIONS.values }

    def reviewable_answers
      {
        "event_options" => event_options.capitalize,
      }
    end

    # def skipped?
    # false
    # end
  end
end
