class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  has_one :rent
  has_one :user, through: :rent
end