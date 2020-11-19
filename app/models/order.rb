class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :orderDate, :subTotal, :total, :status, :gstAmount, :pstAmount, presence: true
  validates :subTotal, :total, :gstAmount, :pstAmount, numericality: true
end
