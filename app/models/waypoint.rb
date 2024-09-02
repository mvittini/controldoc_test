class Waypoint < ApplicationRecord
  belongs_to :vehicle
  validates :latitude, :longitude, :sent_at, :vehicle, presence: true
end
