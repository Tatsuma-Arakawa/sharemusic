class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :board_review
end
