class Event < ApplicationRecord

  belongs_to :user
  has_many :items


  # validates :name, presence:true
  # validates :date, presence:true

end
