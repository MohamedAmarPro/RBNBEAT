class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :rent_start_date, :rent_end_date, presence: true

end
