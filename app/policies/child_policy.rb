class ChildPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    @auth_context.role_model.is_a?(Matchmaker)
  end
end
