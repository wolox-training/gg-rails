FactoryBot.define do
  factory :book_suggestion do
    editorial { Faker::Name.name }
    price     { Faker::Number.decimal(3,2) }
    author    { Faker::Name.name }
    title     { Faker::Book.title }
    link      { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(1800, 2010) }
    user
  end
end
