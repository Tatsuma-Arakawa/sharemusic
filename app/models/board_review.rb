class BoardReview < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  belongs_to :album_board

  validates  :content, presence: true
  validates  :score, presence: true
end
