module Diary::Steps
  class SelectEvent < Wizard::Step
    attribute :event, :string
    attribute :placement_id # avoid typecasting to allow validation to work

    EVENT_OPTIONS = { home_life: "Home life", school_life: "School life", sports: "Sports", physical_health: "Physical health", emotional_health: "Emotional health" }.freeze

    validates :event, inclusion: { in: EVENT_OPTIONS.values }
    validates :placement_id, numericality: { only_integer: true }

    # def reviewable_answers
    #  {
    #    "event_options" => event_options.capitalize,
    #  }
    # end

    # def skipped?
    # false
    # end
  end
end
