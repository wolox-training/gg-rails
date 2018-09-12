class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_rent.subject
  #
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @book = @rent.book
    user = @rent.user
    set_locale(user)

    mail to: user.email, subject: t('.subject')
  end

  def set_locale(user)
    I18n.locale = user.locale || I18n.default_locale
  end
end
