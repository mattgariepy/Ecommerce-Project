class Province < ApplicationRecord
  has_many :Customers, :dependent => :destroy

  validates :name, :gstRate, :pstRate, presence: true
  validates :gstRate, :pstRate, numericality: true
end
