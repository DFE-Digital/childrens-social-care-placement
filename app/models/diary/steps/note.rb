module Diary::Steps
  class Note < Wizard::Step
    attribute :entry, :string

    validates :entry, length: { minimum: 10 }

    def reviewable_answers
      {
        "note" => entry,
      }
    end

  end
end
