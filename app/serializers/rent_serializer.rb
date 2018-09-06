class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :returned_at

  belongs_to :book
  belongs_to :user
end
