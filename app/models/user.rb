class User < ApplicationRecord
  has_many :board_reviews, dependent: :destroy
  has_many :album_boards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  
  validates :username, presence: true,
             length: { maximum: 20 }
  validates :introduce, length: { maximum: 255 }

  def self.guest
    find_or_create_by(email: 'guest@example.com', username: 'guestuser') do |user|
      user.password = SecureRandom.urlsafe_base64
      #user.confirmed at = Time.now
    end
  end

  def remember_me
    true
  end
end
