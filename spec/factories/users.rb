FactoryBot.define do
  factory :user do
    username      { "testuser" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password      { "password" }
  end
end
