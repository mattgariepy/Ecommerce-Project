class Order < ApplicationRecord
  belongs_to :customer
  #has_and_belongs_to_many :order_products, :dependent => :destroy

  validates :orderDate, :subTotal, :total, :status, :gstAmount, :pstAmount, presence: true
  validates :subTotal, :total, :gstAmount, :pstAmount, numericality: true
end
