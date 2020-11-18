FactoryBot.define do
  factory :user do
    username { "testuser" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    
    before(:create){ |user|
      user.skip_confirmation_notification!
      user.skip_confirmation!
    }
  end
end
