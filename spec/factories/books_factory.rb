FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::LoremFlickr.image }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(from: 1950, to: Time.zone.today.year) }
  end
end
