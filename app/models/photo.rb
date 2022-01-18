class Photo < ApplicationRecord

  # mount_uploader :memory_image_id, ImageUploader

  belongs_to :album
  attachment :memory_image
end
