class Coordinate < ApplicationRecord
  validates :longitude, presence: true
  validates :latitude, presence: true

  has_one :city
  has_one :location

  def self.determine(address)
    Geocoder.search(address).first.coordinates
  end
end
