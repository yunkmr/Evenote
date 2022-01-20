class Item < ApplicationRecord

  belongs_to :event

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
