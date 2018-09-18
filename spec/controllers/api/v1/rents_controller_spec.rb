require 'rails_helper'

describe Api::V1::RentsController do
  include_context 'Authenticated User'

  let!(:book) { create(:book) }
  let!(:other_user) { create(:user) }

  describe 'GET #index' do
    let!(:rents) { create_list(:rent, 3, user: user, book: book) }
    let!(:other_rents) { create_list(:rent, 3, user: other_user, book: book) }

    context 'When fetching all rents from the user' do
      before do
        get :index, params: { user_id: user.id }
      end

      it 'responses with the rents json' do
        expect(response_body['page'].pluck('id')).to eq rents.pluck(:id)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    let(:from) { Faker::Date.backward(3) }
    let(:to) { Faker::Date.forward(3) }
    let(:rent_params) do
      { 'user_id' => user.id, 'book_id' => book.id, 'from' => from, 'to' => to }
    end
    let(:other_rent_params) do
      { 'user_id' => other_user.id, 'book_id' => book.id, 'from' => from, 'to' => to }
    end

    context 'When create a rent' do
      before do
        post :create, params: { user_id: user.id, rent: rent_params }
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When create a rent with invalid params' do
      before do
        post :create, params: { user_id: user.id, rent: other_rent_params }
      end

      it 'responds with 401 status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
