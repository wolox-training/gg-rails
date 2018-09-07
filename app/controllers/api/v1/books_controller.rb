module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book, each_serializer: Book::IndexSerializer
      end

      def show
        render json: Book.find(book_params), serializer: Book::ShowSerializer
      end

      private

      def book_params
        params.required(:id)
      end
    end
  end
end
