class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders, :dependent => :destroy

  validates :name, :email, :address, :postalCode, presence: true
  validates :postalCode, length: { is: 6 }
  validates :email, uniqueness: true
end
