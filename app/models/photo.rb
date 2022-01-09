class Photo < ApplicationRecord

  mount_uploader :memory_image_id, ImageUploader
  # attachment :memory_image
  belongs_to :album
end
