class City < ApplicationRecord
  before_create :add_coordinates

  private

  def add_coordinates
    coordinates = Geocoder.search(name).first.coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
end
