require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion) }
      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, title: nil) }
      before do
        post :create, params: { book_suggestion: book_suggestion_attributes }
      end

      it 'doesn\'t create a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attributes }
        end.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response_body['title'][0]).to eq 'can\'t be blank'
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
