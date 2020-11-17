class ShortlistPolicy < ApplicationPolicy
  def show?
    @auth_context.role_model.is_a?(Matchmaker)
  end
end
