module Diary::Steps
  class LogEntry < Wizard::Step
    attribute :entry, :string

    validates :entry, length: { minimum: 10 }

    def reviewable_answers
      {
        "entry" => entry,
      }
    end

    # def skipped?
    # false
    # end
  end
end
