class OrderProduct < ApplicationRecord
  belongs_to :product
  has_many :order_items

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
