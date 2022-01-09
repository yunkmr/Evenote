class Event < ApplicationRecord

  belongs_to :user
  has_many :items
  has_many :albums


  # validates :name, presence:true
  # validates :date, presence:true

end
