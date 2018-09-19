require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create' do
    let(:request) { post :create, params: { book_suggestion: book_suggestion_attributes } }
    
    context 'When creating a valid book suggestion' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion) }

      it 'creates a new book suggestion' do
        expect { request }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        request
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, title: nil) }

      before do
        request
      end

      it 'doesn\'t create a new book suggestion' do
        expect { request }.to change { BookSuggestion.count }.by(0)
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
