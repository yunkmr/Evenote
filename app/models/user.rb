class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy
  # コメント
  has_many :post_comments

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # いいねの関係
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  attachment :profile_image

  # フォローしたときの処理
  def follow(user)
    relationships.create(followed_id: user.id)
  end
  # フォローを外すときの処理
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  # いいねボタンを押せるか判断
  # ①自分が投稿した写真にはいいねできない
  # ②1つの写真には1回しかいいねできない
  # def deletable_user?(posts)
  #   posts && posts.user != self && !user.exists?(post_id: posts.id)
  # end

end
