module Api
  module V1
    class RentsController < ApiController
      def index
        render_paginated Rent
      end

      def create
        rent = Rent.new(rent_params)
        if rent.save
          render json: rent, status: :created
        else
          render json: rent.errors, status: :unprocessable_entity
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to, :returned_at)
      end
    end
  end
end