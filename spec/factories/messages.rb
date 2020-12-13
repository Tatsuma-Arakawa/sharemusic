FactoryBot.define do
  factory :message do
    association :user, factory: :user
    association :room, factory: :room
    content { "testmessage" }
  end
end
