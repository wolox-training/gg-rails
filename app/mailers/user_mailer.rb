class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_rent.subject
  #
  def new_rent(rent)
    @rent = rent
    @book = Book.find(rent.book_id)
    user = User.find(rent.user_id)

    mail to: user.email, subject: 'New rent created'
  end
end
