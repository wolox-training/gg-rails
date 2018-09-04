module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book
      end

      def show
        render json: find_book
      end

      private

      def find_book
        Book.find(book_params)
      end

      def book_params
        params.required(:id)
      end
    end
  end
end
