class Post < ApplicationRecord
  belongs_to :user

  # タグの関係
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  # いいねの関係
	has_many :favorites, dependent: :destroy
  has_many :count_favorited, through: :favorites, source: :user

  mount_uploader :post_image_id, ImageUploader


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
