class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :config_locale

  def config_locale
    I18n.locale = current_user ? current_user.locale || I18n.default_locale : I18n.default_locale
  end
end
