class Book < ApplicationRecord
  validates :title, presence: true
  validates :memo, presence: true

  belongs_to :user

  mount_uploader :picture, PictureUploader
end
