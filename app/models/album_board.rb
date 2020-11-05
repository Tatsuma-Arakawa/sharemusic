class AlbumBoard < ApplicationRecord
  has_many :board_reviews, dependent: :destroy
  mount_uploader :icon, IconUploader

  def avg_score
    unless self.board_reviews.empty?
      board_reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def board_review_score_percentage
    unless self.board_reviews.empty?
      board_reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
