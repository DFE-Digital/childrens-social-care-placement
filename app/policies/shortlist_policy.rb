class ShortlistPolicy < ApplicationPolicy
  def create?
    @auth_context.role_model.is_a?(Matchmaker)
  end
end
