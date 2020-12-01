class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :board_review
  validates_uniqueness_of :board_review_id, scope: :user_id
end
