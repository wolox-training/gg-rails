require 'rails_helper'

describe User do
  subject(:user) { build(:user) }

  it do
    should validate_presence_of(:first_name)
  end

  it do
    should validate_presence_of(:last_name)
  end

  it do
    is_expected.to be_valid
  end

  describe '#generate_verification_code' do
    context 'when the user is created' do
      it 'generates a random verification code' do
        user.save!
        expect(user.verification_code).to be_present
      end
    end
  end

  describe '#create' do
    context 'when the first_name is nil' do
      it do
        user.first_name = nil
        is_expected.to be_invalid
      end
    end

    context 'when the last_name is nil' do
      it do
        user.last_name = nil
        is_expected.to be_invalid
      end
    end
  end
end
