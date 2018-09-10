module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book, each_serializer: BookIndexSerializer
      end

      def show
        render json: Book.find(book_params), serializer: BookShowSerializer
      end

      private

      def book_params
        params.required(:id)
      end
    end
  end
end
