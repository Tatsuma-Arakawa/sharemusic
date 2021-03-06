class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many   :notifications, dependent: :destroy

  validates :content, presence: true,
                      length: { maximum: 1000 }

  def create_notification_message!(current_user)
    @roommembernotme = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
    @theid = @roommembernotme.find_by(room_id: @room.id)
    notification = current_user.active_notifications.new(
      room_id: @room.id,
      message_id: @message.id,
      visited_id: @theid.user_id,
      visitor_id: current_user.id,
      action: 'dm'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
