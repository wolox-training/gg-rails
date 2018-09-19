module Api
  module V1
    class WelcomeController < ApplicationController
      before_action :config_locale, only: [:index]

      def index
        @user_full_name = current_user.first_name + current_user.last_name if current_user
      end

      def config_locale
        I18n.locale = if current_user
                        current_user.locale || I18n.default_locale
                      else
                        I18n.default_locale
                      end
      end
    end
  end
end
