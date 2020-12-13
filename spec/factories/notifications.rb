FactoryBot.define do
  factory :notification_false do
    visitor_id { 2 }
    visited_id { 1 }
    room_id { 1 }
    message_id { 5 }
    action { "dm" }
    checked { false }
  end
end
