FactoryBot.define do
  factory :board_review do
    content { "testreview" }
    title { "testtitle" }
    score { 5 }
    association :user, factory: :test_user
    association :album_board, factory: :album_board
  end
end
