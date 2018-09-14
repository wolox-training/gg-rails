require 'rails_helper'

describe RentPolicy do
  
  describe 'GET #index' do
    context 'When fetching all rents from the user' do
      let!(:book) { create(:book) }
      let!(:user) { create(:user) }
      let!(:another_user) { create(:user) }
      let!(:rents) { create_list(:rent, 3, user: user, book: book) }
      subject { described_class }
  
      permissions :index? do
        it "grants access" do
          expect(subject).to permit(user, rents)
        end
      end  
    end

    context 'When fetching all rents from another user' do
      let!(:book) { create(:book) }
      let!(:user) { create(:user) }
      let!(:another_user) { create(:user) }
      let!(:rents) { create_list(:rent, 3, user: user, book: book) }
      subject { described_class }
  
      permissions :index? do  
        it "denies access" do
          expect(subject).not_to permit(another_user, rents)
        end
      end  
    end
  end
end
