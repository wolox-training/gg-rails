class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_rent.subject
  #
  def new_rent
    @greeting = "Hi"

    mail to: "gonzalo.gutierrez@wolox.com.ar"
  end
end
