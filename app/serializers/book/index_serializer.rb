class Book::IndexSerializer < BookSerializer
  attributes :image, :created_at, :updated_at

  def image
    { url: object.image }
  end
end
