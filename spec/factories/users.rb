FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length:6)
    password {password}
    password_confirmation {password}
    name {Faker::Lorem.characters(number:4)}
    introduction {Faker::Lorem.characters(number:20)}
    image_id {Faker::Lorem.characters(number:6)}
  end
end