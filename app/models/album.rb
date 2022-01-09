class Album < ApplicationRecord

  belongs_to :user
  belongs_to :event

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

end
