class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy

  attachment :profile_image
end
