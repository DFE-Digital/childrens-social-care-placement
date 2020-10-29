class ApplicationPolicy
  attr_reader :auth_context, :record

  def initialize(auth_context, record)
    @auth_context = auth_context
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :auth_context, :scope

    def initialize(auth_context, scope)
      @auth_context = auth_context
      @scope = scope
    end

    def resolve
      scope.none
    end
  end
end
