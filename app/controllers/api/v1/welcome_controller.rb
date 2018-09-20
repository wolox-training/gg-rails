module Api
  module V1
    class WelcomeController < ApplicationController
      before_action :config_locale, only: [:index]

      def index
        @user_full_name = current_user.first_name + current_user.last_name if current_user
      end
    end
  end
end
