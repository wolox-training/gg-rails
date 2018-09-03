class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  has_many :rent, dependent: :nullify
  has_many :user, through: :rent
end
