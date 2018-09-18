class User < ApplicationRecord
  validates :email, :encrypted_password, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum locale: { en: 0, es: 1 }, _prefix: :language

  before_validation :generate_verification_code, on: :create

  has_many :rents, dependent: :restrict_with_error
  has_many :book_suggestions, dependent: :nullify
  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
