class Instrument < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }



  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  validates :name, :category, :brand, :age, :price, presence: true
end
