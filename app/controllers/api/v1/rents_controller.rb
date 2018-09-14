module Api
  module V1
    class RentsController < ApiController
      def index
        rents = User.find(user_params).rents
        authorize rents
        render_paginated rents
      end

      def create
        rent = Rent.new(rent_params)
        authorize rent
        if rent.save
          UserMailer.new_rent(rent.id).deliver_later
          render json: rent, status: :created
        else
          render json: rent.errors, status: :unprocessable_entity
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to, :returned_at)
      end

      def user_params
        params.required(:user_id)
      end
    end
  end
end
