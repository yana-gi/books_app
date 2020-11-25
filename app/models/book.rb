class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :memo, presence: true

  mount_uploader :picture, PictureUploader
end
