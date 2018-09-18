require 'rails_helper'

describe Api::V1::RentsController do
  include_context 'Authenticated User'

  describe 'GET #index' do
    let!(:book) { create(:book) }
    let!(:another_user) { create(:user) }
    let!(:rents) { create_list(:rent, 3, user: user, book: book) }
    let(:rent_id) { ->(rent) { rent['id'] } }

    context 'When fetching all rents from the user' do
      before do
        get :index, params: { user_id: user.id }
      end

      it 'responses with the rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response_body['page'].map(&rent_id)).to eq JSON.parse(expected).map(&rent_id)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
