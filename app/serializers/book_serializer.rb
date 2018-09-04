class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre, :publisher, :year
  attribute :image, key: :image_url
  
  has_many :rent
end
