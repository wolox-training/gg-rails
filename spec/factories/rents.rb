FactoryBot.define do
  factory :rent do
    user
    book
    from  { Faker::Date.backward(3) }
    to    { Faker::Date.forward(3) }
  end
end
