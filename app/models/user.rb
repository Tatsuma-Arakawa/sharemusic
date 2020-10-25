class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  validates :username,  length: { maximum: 20 }
  validates :introduce, length: { maximum: 255 }

  def remember_me
    true
  end
end
