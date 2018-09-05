module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book
      end

      def show
        render json: Book.find(book_params)
      end

      private

      def book_params
        params.required(:id)
      end
    end
  end
end
