class Ticket < ApplicationRecord

  belongs_to :user

  validates :event_name, presence:true
  validates :event_date, presence:true

end
