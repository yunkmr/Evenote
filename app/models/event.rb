class Event < ApplicationRecord

  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :albums, dependent: :destroy


  validates :name, presence:true
  validates :date, presence:true

end
