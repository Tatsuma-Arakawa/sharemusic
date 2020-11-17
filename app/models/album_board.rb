class AlbumBoard < ApplicationRecord
  has_many :board_reviews, dependent: :destroy
  mount_uploader :icon, IconUploader

  def avg_score
    if board_reviews.empty?
      0.0
    else
      board_reviews.average(:score).round(1).to_f
    end
  end

  def board_review_score_percentage
    if board_reviews.empty?
      0.0
    else
      board_reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
