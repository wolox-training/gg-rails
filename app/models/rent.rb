class Rent < ApplicationRecord
  validates :user, :book, :from, :to, presence: true

  belongs_to :user
  belongs_to :book
end
