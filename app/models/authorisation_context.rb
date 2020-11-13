class AuthorisationContext
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def role_model
    @role_model ||= @user.foster_parent || @user.matchmaker || @user
  end
end
