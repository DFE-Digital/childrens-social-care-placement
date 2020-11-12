class UsersController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped

private

  def after_sign_in_path_for(_resource_or_scope)
    if pundit_user.role_model.is_a?(FosterParent)
      foster_parent_path(pundit_user.role_model)
    elsif pundit_user.role_model.is_a?(Matchmaker)
      dashboards_matchmaker_path
    else
      super
    end
  end
end
