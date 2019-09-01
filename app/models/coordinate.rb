# frozen_string_literal: true

class Coordinate < ApplicationRecord
  validates :longitude, presence: true
  validates :latitude, presence: true

  has_one :city
  has_one :location

  def self.determine(address_string)
    Geocoder.search(address_string).first.coordinates
  end

  def self.calculate_distance(coordinates1, coordinates2)
    earth_radius_in_kms = 6371
    phi1 = Coordinate.degree_to_radian(coordinates1.latitude)
    phi2 = Coordinate.degree_to_radian(coordinates2.latitude)
    delta_phi = Coordinate.degree_to_radian(coordinates1.latitude - coordinates2.latitude)
    delta_lambda = Coordinate.degree_to_radian(coordinates1.longitude - coordinates2.longitude)
    a = Math.sin(delta_phi / 2)**2 +
        Math.cos(phi1) * Math.cos(phi2) *
        Math.sin(delta_lambda / 2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    distance_in_kms = earth_radius_in_kms * c
  end

  def self.degree_to_radian(degree)
    degree * Math::PI / 180
  end
end
