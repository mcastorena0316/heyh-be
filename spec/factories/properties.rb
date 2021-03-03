FactoryBot.define do
  factory :property, class: Property do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    rental_price { 3000 }
    status { 'deleted' }
    tenant_name { Faker::Name.name }
    tenant_email  { Faker::Internet.email }
    tenant_phone { Faker::PhoneNumber.phone_number }
    tenant_availability { [{ start_date: '2020-01-02T16:45:27+02:00', end_date: '2020-01-03T16:45:27+02:00' }] }
  end
end
