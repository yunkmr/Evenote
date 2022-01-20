class Photo < ApplicationRecord

  # mount_uploader :memory_image_id, ImageUploader

  belongs_to :album
  attachment :memory_image

  # validates :memory_image, attached_file_presence: true
end
