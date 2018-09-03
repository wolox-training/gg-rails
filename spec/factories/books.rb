FactoryBot.define do
  factory :book do
    genre     { Faker::Book.genre }
    author    { Faker::Name.name }
    image     { Faker::Internet.url }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(1800, 2010) }
  end
end
