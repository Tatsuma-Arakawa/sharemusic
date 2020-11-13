class User < ApplicationRecord
  has_many :board_reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_boardreviews, through: :favorites, source: :board_review
  has_many :album_boards
  has_many :active_relationships,  class_name: "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:  :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:  :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :image, ImageUploader
  
  validates :username, presence: true,
             length: { maximum: 20 }
  validates :introduce, length: { maximum: 255 }

  def self.guest
    find_or_create_by(email: 'guest@example.com', username: 'guestuser') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end

  def remember_me
    true
  end

  def follow(other_user)
    self.active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    self.following.include?(other_user)
  end

  def already_favorite?(favorite_boardreview)
    favorites.exists?(board_review_id: favorite_boardreview.id)
  end

  def self.search(search)
    if search
      User.where(['username LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
end
