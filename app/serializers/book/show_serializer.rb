class Book::ShowSerializer < BookSerializer
  attribute :image, key: :image_url
  attribute :actual_rent

  def actual_rent
    Rent.where("book_id = ?", object.id).last
  end
end
