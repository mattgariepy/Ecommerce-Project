class AboutContact < ApplicationRecord
  validates :aboutTitle, :aboutText, :contactNumber, :contactEmail, :contactTitle, :contactText, presence: true
end
