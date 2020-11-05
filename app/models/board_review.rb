class BoardReview < ApplicationRecord
  belongs_to :user
  belongs_to :album_board
  validates  :content, presence: true
  validates  :score, presence: true
end
