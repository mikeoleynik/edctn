FactoryBot.define do
  factory :task do
    title { Faker::Quote.yoda }
    body { Faker::Lorem.paragraph }
    difficulty { rand(1..10) }
    theme_id { nil }
  end
end