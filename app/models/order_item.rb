class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :order_product
end
