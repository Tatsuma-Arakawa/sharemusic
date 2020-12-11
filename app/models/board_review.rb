class BoardReview < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  belongs_to :album_board
  has_many   :notifications, dependent: :destroy

  validates :content, presence: true,
                      length: { maximum: 1000 }
  validates :score, presence: true
  validates :title, presence: true,
                    length: { maximum: 100 }
end
