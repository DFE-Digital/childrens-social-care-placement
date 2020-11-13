module Diary
  class WizardPolicy < ApplicationPolicy
    def show?
      true
      # @auth_context.role_model.is_a?(FosterParent)
    end
  end
end
