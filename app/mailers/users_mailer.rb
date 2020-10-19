class UsersMailer < Devise::Mailer
  def reset_password_instructions(user, token, _opts = {})
    @user = user
    @token = token
    view_mail(Settings.notify.view_template_id, to: @user.email, subject: t("devise.mailer.reset_password_instructions.subject"))
  end
end
