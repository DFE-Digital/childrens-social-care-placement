class ApplicationMailer < Mail::Notify::Mailer
  default from: "from@example.com"
  layout "mailer"
end
