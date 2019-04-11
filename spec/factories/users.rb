FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { Faker::Internet.email(name) }
    password { Faker::Internet.password }
  end
end
