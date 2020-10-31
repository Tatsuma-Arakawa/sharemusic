class AlbumBoard < ApplicationRecord
  has_many :board_reviews, dependent: :destroy
  mount_uploader :icon, IconUploader
end
