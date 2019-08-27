class Coordinate < ApplicationRecord

  validates :longitude, presence: true
  validates :latitude, presence: true
  
end
