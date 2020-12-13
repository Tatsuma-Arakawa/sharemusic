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

  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and board_review_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        board_review_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end      
end
