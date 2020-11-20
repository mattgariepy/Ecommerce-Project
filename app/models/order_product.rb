class OrderProduct < ApplicationRecord
  belongs_to :product
  #has_and_belongs_to_many :orders, :dependent => :destroy

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
end
