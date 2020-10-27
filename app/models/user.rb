class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  validates :username, presence: true,
             length: { maximum: 20 }
  validates :introduce, length: { maximum: 255 }

  def remember_me
    true
  end
end
