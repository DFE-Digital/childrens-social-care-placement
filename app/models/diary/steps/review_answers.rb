module Diary::Steps
  class ReviewAnswers < Wizard::Step
    def answers_by_step
      @answers_by_step ||= @wizard.reviewable_answers_by_step
    end
  end
end
