class Instrument < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  validates :name, :category, :brand, :age, :price, presence: true
end
