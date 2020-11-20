class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products, :dependent => :destroy

  validates :name, :description, :price, presence: true
  validates :price,  numericality: true

  has_one_attached :image
end
