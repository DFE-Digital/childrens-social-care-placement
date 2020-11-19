class DiaryEntryPolicy < ApplicationPolicy
  def show?
    @auth_context.role_model.is_a?(FosterParent)
  end

  class Scope < Scope
    def resolve
      if @auth_context.role_model.is_a?(FosterParent)
        scope.all
      end
    end
  end
end
