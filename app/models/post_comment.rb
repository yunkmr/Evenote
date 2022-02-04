class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :notifications, foreign_key: :post_comment_id, dependent: :destroy

  validates :comment, presence: true, length: {minimum: 2}, uniqueness: { scope: [:post_id, :user_id] }

end
