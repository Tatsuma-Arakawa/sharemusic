FactoryBot.define do
  factory :favorite do
    association :user, factory: :test_user
    association :board_review, factory: :board_review
  end
end
