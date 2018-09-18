module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request, only: [:create]

      def create
        book_suggestion = BookSuggestion.new(book_suggestion_params)
        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: book_suggestion.errors, status: :unprocessable_entity
        end
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion).permit(:title, :author, :link, :user_id)
      end
    end
  end
end
