class City < ApplicationRecord
  before_create :add_coordinates

  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  
  private

  def add_coordinates
    coordinates = Geocoder.search(name).first.coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
end
