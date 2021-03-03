FactoryBot.define do
  factory :user, class: User do
    email  { Faker::Internet.email }
    password { '1234567'}
  end
end
