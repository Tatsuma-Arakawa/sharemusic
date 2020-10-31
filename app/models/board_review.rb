class BoardReview < ApplicationRecord
  belongs_to :user
  belongs_to :artist_board
end
