class ShortlistPolicy < ApplicationPolicy
  def edit?
    create?
  end

  def update?
    create?
  end

  def create?
    @auth_context.role_model.is_a?(Matchmaker)
  end

  class Scope < Scope
    def resolve
      if @auth_context.role_model.is_a?(Matchmaker)
        scope.all
      else
        scope.none
      end
    end
  end
end
