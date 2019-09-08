FactoryBot.define do
  factory :user do
    fullname { Faker::Artist.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 8, max_length: 20) }
  end
end