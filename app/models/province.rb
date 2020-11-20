class Province < ApplicationRecord
  has_many :Customers

  validates :name, :gstRate, :pstRate, presence: true
  validates :gstRate, :pstRate, numericality: true
end
