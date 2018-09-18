require 'rails_helper'

describe Api::V1::RentsController do
  include_context 'Authenticated User'

  describe 'GET #index' do
    let!(:book) { create(:book) }
    let!(:another_user) { create(:user) }
    let!(:rents) { create_list(:rent, 3, user: user, book: book) }

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
end
