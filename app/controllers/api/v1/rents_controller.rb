module Api
  module V1
    class RentsController < ApiController
      def index
        render_paginated Rent
      end
    end
  end
end
