class Book
  class ShowSerializer < BookSerializer
    attribute :image, key: :image_url
    attribute :actual_rent

    def actual_rent
      object.rents.last
    end
  end
end
