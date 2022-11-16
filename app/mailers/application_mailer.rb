class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("password-reset@gratitude.naleo.me","Gratitude")
  layout "mailer"
end
