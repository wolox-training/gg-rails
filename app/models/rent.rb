class Rent < ApplicationRecord
  validates :user, :book, :from, :to, presence: true

  belongs_to :user, counter_cache: true
  belongs_to :book
end
