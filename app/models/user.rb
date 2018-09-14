class User < ApplicationRecord
  validates :email, :encrypted_password, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum locale: [:en, :es], _prefix: :language

  before_validation :generate_verification_code, on: :create

  has_many :rents, dependent: :restrict_with_error
  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
