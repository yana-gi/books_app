class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, length: { maximum: 30 }
  validates :name, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }, if: :postal_code?
  validates :address, length: { maximum: 100 }
  validates :description, length: { maximum: 250 }
end
