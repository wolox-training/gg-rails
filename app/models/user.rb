class User < ApplicationRecord
  validates :email, :encrypted_password, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  enum locale: { en: 0, es: 1 }, _prefix: :language

  before_validation :generate_verification_code, on: :create

  has_many :rents, dependent: :restrict_with_error
  has_many :book_suggestions, dependent: :nullify
  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    user ||= User.create(
      first_name: data['first_name'], last_name: data['last_name'],
      email: data['email'], password: Devise.friendly_token[0, 20]
    )
    user
  end
end
