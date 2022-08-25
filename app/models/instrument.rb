class Instrument < ApplicationRecord
  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  validates :name, :category, :brand, :age, :price, presence: true
end
